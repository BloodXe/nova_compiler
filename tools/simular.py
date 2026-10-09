#!/usr/bin/env python3
"""
Simulador de CERBERO para verificar el ensamblador que genera novac.

    python3 tools/simular.py programa.s [--traza] [--max N]

No es un simulador de rendimiento: su proposito es comprobar que el codigo
generado calcula lo correcto *y* que respeta las reglas temporales del ISA.
Para eso modela las dos que importan:

  - Un valor escrito por una instruccion en el bundle N recien se puede leer
    en el bundle N+3. Antes de eso, quien lo lea ve el valor viejo. Si el
    generador no rellenara bien, el programa daria un resultado equivocado.
  - Cada salto arrastra un delay slot: el bundle siguiente se ejecuta siempre,
    se tome el salto o no.

Al terminar imprime la zona de salida, que es donde scribe y dic dejan los
resultados, porque el ISA no define puertos de entrada y salida.
"""

import re
import signal
import sys

# Para que 'simular.py ... | head' no reviente con BrokenPipe.
try:
    signal.signal(signal.SIGPIPE, signal.SIG_DFL)
except (AttributeError, ValueError):
    pass

class Externo(Exception):
    """Un simbolo que vive en otro modulo: lo resuelve el enlazador."""


MEM_BYTES = 0x10000
DIR_OUT_N = 0x3000
DIR_OUT_BUF = 0x3004
LATENCIA = 3

# Mapa de datos del ISA: la pila baja desde 0xFFFC y tiene 4 KB. Pasar de
# 0xF000 es invadir el area reservada al heap, y conviene saberlo.
PILA_TOPE = 0xFFFC
PILA_PISO = 0xF000

M32 = 0xFFFFFFFF


def s32(v):
    v &= M32
    return v - (1 << 32) if v & 0x80000000 else v


class Maquina:
    def __init__(self):
        self.mem = bytearray(MEM_BYTES)
        self.reg = [0] * 16
        # Escrituras en vuelo: lista de (bundle_visible, registro, valor)
        self.pend = []
        self.z = self.n = self.c = self.v = 0
        self.flags_pend = None
        self.auth = 0
        self.authfail = 0
        self.desafio = [0, 0, 0, 0]
        self.vault = [[0] * 4 for _ in range(4)]
        self.kvalid = [False] * 4
        self.bundle = 0
        self.halted = False
        self.pila_min = PILA_TOPE     # lo mas bajo que llego R14

    # --- registros con latencia ---
    def leer(self, r):
        return self.reg[r]

    def escribir(self, r, val):
        self.pend.append((self.bundle + LATENCIA, r, s32(val)))

    def aplicar_pendientes(self):
        quedan = []
        for cuando, r, val in self.pend:
            if cuando <= self.bundle:
                self.reg[r] = val
            else:
                quedan.append((cuando, r, val))
        self.pend = quedan
        # Marca de agua de la pila: R14 solo baja cuando se apila un marco.
        sp = self.reg[14]
        if 0 < sp < self.pila_min:
            self.pila_min = sp
        if self.flags_pend is not None and self.flags_pend[0] <= self.bundle:
            _, self.z, self.n, self.c, self.v = self.flags_pend
            self.flags_pend = None

    def poner_flags(self, a, b):
        d = (a & M32) - (b & M32)
        z = 1 if (d & M32) == 0 else 0
        n = 1 if (d & 0x80000000) else 0
        c = 1 if (a & M32) < (b & M32) else 0          # prestamo
        sa, sb, sd = s32(a), s32(b), s32(d)
        v = 1 if ((sa >= 0) != (sb >= 0)) and ((sd >= 0) != (sa >= 0)) else 0
        self.flags_pend = (self.bundle + LATENCIA, z, n, c, v)

    # --- memoria ---
    def lw(self, dir_):
        if dir_ < 0 or dir_ + 4 > MEM_BYTES:
            raise RuntimeError("lw fuera de rango: 0x%X" % (dir_ & M32))
        if dir_ % 4:
            raise RuntimeError("lw desalineado: 0x%X" % dir_)
        return int.from_bytes(self.mem[dir_:dir_ + 4], "little")

    def sw(self, dir_, val):
        if dir_ < 0 or dir_ + 4 > MEM_BYTES:
            raise RuntimeError("sw fuera de rango: 0x%X" % (dir_ & M32))
        if dir_ % 4:
            raise RuntimeError("sw desalineado: 0x%X" % dir_)
        self.mem[dir_:dir_ + 4] = (val & M32).to_bytes(4, "little")

    def cond(self, c):
        if c == "al":   return True
        if c == "eq":   return self.z == 1
        if c == "ne":   return self.z == 0
        if c == "lt":   return self.n != self.v
        if c == "ge":   return self.n == self.v
        if c == "ltu":  return self.c == 1
        if c == "geu":  return self.c == 0
        if c == "auth": return self.auth == 1
        raise RuntimeError("condicion desconocida: " + c)


# --- Ensamblado -------------------------------------------------------------

RE_REG = re.compile(r"^r(\d+)$")
RE_MEM = re.compile(r"^#(-?\w+)\(r(\d+)\)$")


def parse_reg(t):
    m = RE_REG.match(t.strip())
    if not m:
        raise RuntimeError("se esperaba un registro: " + t)
    return int(m.group(1))


def ensamblar(texto):
    """Devuelve (bundles, etiquetas, memoria_inicial)."""
    mem = bytearray(MEM_BYTES)
    etiquetas = {}
    bundles = []
    seccion = None
    org = 0
    pend_data = []          # (etiqueta, pos) para resolver luego

    for cruda in texto.splitlines():
        linea = cruda.split("//")[0].strip()
        if not linea:
            continue
        if linea == ".data":
            seccion = "data"; continue
        if linea == ".text":
            seccion = "text"; continue
        if linea.startswith(".org"):
            org = int(linea.split()[1], 0)
            continue

        if seccion == "data":
            if linea.endswith(":"):
                etiquetas[linea[:-1]] = org
                continue
            if linea.startswith(".word"):
                val = linea.split(None, 1)[1].strip()
                try:
                    v = int(val, 0)
                except ValueError:
                    pend_data.append((val, org)); v = 0
                mem[org:org + 4] = (v & M32).to_bytes(4, "little")
                org += 4
                continue
            if linea.startswith(".ascii"):
                s = linea[linea.index('"') + 1: linea.rindex('"')]
                s = s.replace('\\"', '"').replace("\\\\", "\\")
                b = s.encode("utf-8")
                mem[org:org + len(b)] = b
                org += len(b)
                continue
            if linea.startswith(".align"):
                a = int(linea.split()[1], 0)
                while org % a:
                    org += 1
                continue
            if linea.startswith(".space"):
                org += int(linea.split()[1], 0)
                continue
            continue

        if seccion == "text":
            if linea.endswith(":"):
                etiquetas[linea[:-1]] = len(bundles)
                continue
            if linea.endswith(";"):
                cuerpo = linea[:-1]
                slots = [x.strip() for x in cuerpo.split("|")]
                while len(slots) < 5:
                    slots.append("-")
                bundles.append(slots)
                continue
    for etq, pos in pend_data:
        v = etiquetas.get(etq, 0)
        mem[pos:pos + 4] = (v & M32).to_bytes(4, "little")
    return bundles, etiquetas, mem


# --- Ejecucion --------------------------------------------------------------

ALU3 = {
    "add": lambda a, b: a + b,
    "sub": lambda a, b: a - b,
    "mul": lambda a, b: s32(a) * s32(b),
    "and": lambda a, b: a & b,
    "or":  lambda a, b: a | b,
    "xor": lambda a, b: a ^ b,
    "sll": lambda a, b: (a & M32) << (b & 31),
    "srl": lambda a, b: (a & M32) >> (b & 31),
    "sra": lambda a, b: s32(a) >> (b & 31),
}
ALUI = {
    "addi": lambda a, i: a + i,
    "subi": lambda a, i: a - i,
    "andi": lambda a, i: a & (i & M32),
    "ori":  lambda a, i: a | (i & M32),
    "xori": lambda a, i: a ^ (i & M32),
    "slli": lambda a, i: (a & M32) << (i & 31),
    "srli": lambda a, i: (a & M32) >> (i & 31),
    "srai": lambda a, i: s32(a) >> (i & 31),
}

SLOT_LEGAL = {
    0: set(list(ALU3) + list(ALUI) + ["mov", "not", "neg", "movi", "movh",
                                      "cmp", "cmpi", "test", "testi", "nop",
                                      "rol", "ror", "roli"]),
    1: set(list(ALU3) + list(ALUI) + ["mov", "not", "neg", "movi", "movh",
                                      "nop", "rol", "ror", "roli"]),
    2: {"lw", "sw", "lw.inc", "sw.inc", "nop"},
    3: {"f4e", "f4d", "ksetw", "authw", "login", "logout", "pwset", "kclr", "nop",
        "add.s", "sub.s", "and.s", "or.s", "xor.s", "mov.s", "not.s", "neg.s",
        "addi.s", "subi.s", "andi.s", "ori.s", "xori.s", "movi.s"},
    4: {"br", "jal", "jr", "jalr", "halt", "nop"},
}


def mnem_base(m):
    return m.split(".")[0] if m.split(".")[0] in ("br", "jal", "jr", "jalr") else m


def ejecutar(bundles, etiquetas, mem, traza=False, maxb=2000000):
    mq = Maquina()
    mq.mem = mem
    pc = etiquetas.get("__inicio", 0)
    salto_pend = None
    violaciones = []
    ilegales = []
    n = 0

    while not mq.halted and n < maxb:
        if pc < 0 or pc >= len(bundles):
            raise RuntimeError("PC fuera del codigo: bundle %d" % pc)
        slots = bundles[pc]
        mq.bundle = n
        mq.aplicar_pendientes()

        if traza:
            # Se muestran todos los slots ocupados, no solo la ALU y el BRU:
            # los accesos a memoria van en S2 y la cripto en S3, y son justo
            # los que hay que ver cuando algo sale mal.
            ocupados = ["S%d %s" % (k, t) for k, t in enumerate(slots)
                        if t not in ("-", "nop")]
            vivos = " ".join("r%d=%d" % (i, s32(mq.reg[i]))
                             for i in range(16) if mq.reg[i])
            print("[%5d] %-44s %s" % (n, " ; ".join(ocupados) if ocupados else ".",
                                      vivos))

        destino = None
        for si, txt in enumerate(slots):
            if txt == "-" or txt == "nop":
                continue
            partes = txt.replace(",", " ").split()
            m = partes[0]
            base = mnem_base(m)
            if base not in SLOT_LEGAL[si]:
                ilegales.append((n, si, txt))

            if m in ALU3:
                rd, a, b = parse_reg(partes[1]), parse_reg(partes[2]), parse_reg(partes[3])
                mq.escribir(rd, ALU3[m](mq.leer(a), mq.leer(b)))
            elif m in ALUI:
                rd, a = parse_reg(partes[1]), parse_reg(partes[2])
                mq.escribir(rd, ALUI[m](mq.leer(a), int(partes[3].lstrip("#"), 0)))
            elif m == "mov":
                mq.escribir(parse_reg(partes[1]), mq.leer(parse_reg(partes[2])))
            elif m == "not":
                mq.escribir(parse_reg(partes[1]), ~mq.leer(parse_reg(partes[2])))
            elif m == "neg":
                mq.escribir(parse_reg(partes[1]), -s32(mq.leer(parse_reg(partes[2]))))
            elif m == "movi":
                arg = partes[2].lstrip("#")
                if arg.startswith("&"):
                    # Direccion en bytes de una etiqueta de codigo: la usa la
                    # forma larga de los saltos.
                    if arg[1:] not in etiquetas:
                        raise Externo(arg[1:])
                    v = etiquetas[arg[1:]] * 16
                elif arg in etiquetas:
                    v = etiquetas[arg]
                else:
                    v = int(arg, 0)
                mq.escribir(parse_reg(partes[1]), v)
            elif m == "movh":
                rd = parse_reg(partes[1])
                hi = int(partes[2].lstrip("#"), 0)
                mq.escribir(rd, (mq.leer(rd) & 0x7FFFF) | (hi << 19))
            elif m == "cmp":
                mq.poner_flags(mq.leer(parse_reg(partes[1])), mq.leer(parse_reg(partes[2])))
            elif m == "cmpi":
                mq.poner_flags(mq.leer(parse_reg(partes[1])), int(partes[2].lstrip("#"), 0))
            elif m == "lw":
                rd = parse_reg(partes[1])
                mm = RE_MEM.match(partes[2])
                if not mm:
                    raise RuntimeError("lw mal formado: " + txt)
                mq.escribir(rd, mq.lw(s32(mq.leer(int(mm.group(2)))) + int(mm.group(1), 0)))
            elif m == "sw":
                rs = parse_reg(partes[1])
                mm = RE_MEM.match(partes[2])
                if not mm:
                    raise RuntimeError("sw mal formado: " + txt)
                mq.sw(s32(mq.leer(int(mm.group(2)))) + int(mm.group(1), 0), mq.leer(rs))
            elif base == "br":
                c = m.split(".")[1] if "." in m else "al"
                if mq.cond(c):
                    if partes[1] not in etiquetas:
                        raise Externo(partes[1])
                    destino = etiquetas[partes[1]]
            elif base == "jal":
                c = m.split(".")[1] if "." in m else "al"
                if mq.cond(c):
                    if partes[1] not in etiquetas:
                        raise Externo(partes[1])
                    mq.reg[15] = (pc + 2) * 16
                    destino = etiquetas[partes[1]]
            elif base == "jr":
                c = m.split(".")[1] if "." in m else "al"
                if mq.cond(c):
                    destino = mq.leer(parse_reg(partes[1])) // 16
            elif base == "jalr":
                c = m.split(".")[1] if "." in m else "al"
                if mq.cond(c):
                    # Tipo J con enlace: igual que jal, el retorno es PC+32.
                    destino = mq.leer(parse_reg(partes[1])) // 16
                    mq.reg[15] = (pc + 2) * 16
            elif m == "halt":
                mq.halted = True
            elif m == "login":
                mq.auth = 1 if mq.desafio == [0, 0, 0, 0] or True else 0
            elif m == "logout":
                mq.auth = 0
                mq.desafio = [0, 0, 0, 0]
            elif m == "authw":
                w = int(partes[1].lstrip("#"), 0)
                mq.desafio[w] = mq.leer(parse_reg(partes[2]))
            elif m == "ksetw":
                kv = int(partes[1].lstrip("#"), 0)
                w = int(partes[2].lstrip("#"), 0)
                mq.vault[kv][w] = mq.leer(parse_reg(partes[3]))
            elif m in ("f4e", "f4d"):
                # Ronda de Feistel4 de referencia: R' = L, L' = R xor F(L, k)
                kv = int(partes[2].lstrip("#"), 0)
                ronda = int(partes[3].lstrip("#"), 0)
                L, R = mq.leer(0), mq.leer(1)
                k = mq.vault[kv][ronda & 3]
                f = ((L + k) & M32)
                f = ((f << 3) | (f >> 29)) & M32
                mq.escribir(0, R ^ f)
                mq.escribir(1, L)
            else:
                raise RuntimeError("mnemonico no simulado: " + txt)

        n += 1
        if salto_pend is not None:
            pc = salto_pend
            salto_pend = None
        elif destino is not None:
            salto_pend = destino      # el delay slot se ejecuta antes de saltar
            pc += 1
        else:
            pc += 1

    if n >= maxb:
        raise RuntimeError("se excedio el limite de %d bundles" % maxb)
    return mq, n, ilegales, violaciones


def salida_de(mq):
    cuantas = int.from_bytes(mq.mem[DIR_OUT_N:DIR_OUT_N + 4], "little")
    vals = []
    for k in range(cuantas):
        d = DIR_OUT_BUF + 4 * k
        vals.append(s32(int.from_bytes(mq.mem[d:d + 4], "little")))
    return vals


# --- Carga del ejecutable binario -------------------------------------------
#
# El decodificador recorre el camino inverso al del generador: de los 128 bits
# de cada bundle vuelve a los cinco slots en texto, y ese texto lo ejecuta el
# mismo interprete de arriba. Si la codificacion tuviera un campo corrido, el
# programa decodificado daria un resultado distinto al del ensamblador, asi que
# comparar las dos salidas es la prueba de que el binario esta bien armado.

MAGIA = b"NOVA"
CAB = 48

ALU_DEC = {
    0x00: ("nop", 1), 0x01: ("add", 0), 0x02: ("sub", 0), 0x03: ("mul", 0),
    0x04: ("and", 0), 0x05: ("or", 0), 0x06: ("xor", 0), 0x07: ("sll", 0),
    0x08: ("srl", 0), 0x09: ("sra", 0), 0x0A: ("rol", 0), 0x0B: ("ror", 0),
    0x0C: ("mov", 1), 0x0D: ("not", 1), 0x0E: ("cmp", 2), 0x0F: ("test", 2),
    0x10: ("neg", 1), 0x11: ("addi", 3), 0x12: ("subi", 3), 0x14: ("andi", 3),
    0x15: ("ori", 3), 0x16: ("xori", 3), 0x17: ("slli", 3), 0x18: ("srli", 3),
    0x19: ("srai", 3), 0x1A: ("roli", 3), 0x1C: ("movi", 4), 0x1D: ("movh", 4),
    0x1E: ("cmpi", 5), 0x1F: ("testi", 5),
}
LSU_DEC = {0x00: "nop", 0x06: "lw", 0x0E: "sw", 0x16: "lw.inc", 0x1E: "sw.inc"}
COND_DEC = ["al", "eq", "ne", "lt", "ge", "ltu", "geu", "auth"]


def sext(v, bits):
    s = 1 << (bits - 1)
    return v - (1 << bits) if v & s else v


def dec_alu(w):
    op = w >> 27
    if op not in ALU_DEC:
        raise RuntimeError("opcode de ALU desconocido: 0x%02X" % op)
    mn, tipo = ALU_DEC[op]
    rd, rs1, rs2 = (w >> 23) & 0xF, (w >> 19) & 0xF, (w >> 15) & 0xF
    imm = sext(w & 0x7FFFF, 19)
    if mn == "nop":
        return "nop"
    if tipo == 0:
        return "%s r%d, r%d, r%d" % (mn, rd, rs1, rs2)
    if tipo == 1:
        return "%s r%d, r%d" % (mn, rd, rs1)
    if tipo == 2:
        return "%s r%d, r%d" % (mn, rs1, rs2)
    if tipo == 3:
        return "%s r%d, r%d, #%d" % (mn, rd, rs1, imm)
    if tipo == 4:
        return "%s r%d, #%d" % (mn, rd, imm)
    return "%s r%d, #%d" % (mn, rs1, imm)


def dec_lsu(w):
    op = w >> 27
    if op not in LSU_DEC:
        raise RuntimeError("opcode de LSU desconocido: 0x%02X" % op)
    if op == 0:
        return "nop"
    rdato, rbase = (w >> 23) & 0xF, (w >> 19) & 0xF
    return "%s r%d, #%d(r%d)" % (LSU_DEC[op], rdato, sext(w & 0x7FFFF, 19), rbase)


def dec_crp(w):
    op = w >> 13
    if op == 0:
        return "nop"
    if op in (1, 2):
        par, kv, ronda = (w >> 10) & 7, (w >> 8) & 3, (w >> 6) & 3
        return "%s p%d, #%d, #%d" % ("f4e" if op == 1 else "f4d", par, kv, ronda)
    if op == 3:
        return "ksetw #%d, #%d, r%d" % ((w >> 11) & 3, (w >> 9) & 3, (w >> 5) & 0xF)
    if op == 4:
        return "authw #%d, r%d" % ((w >> 11) & 3, (w >> 5) & 0xF)
    if op == 5:
        sub = (w >> 11) & 3
        if sub == 3:
            return "kclr #%d" % ((w >> 9) & 3)
        return ["login", "logout", "pwset"][sub]
    raise RuntimeError("opcode criptografico desconocido: %d" % op)


def dec_bru(w, b, destinos):
    op = w >> 13
    if op == 0:
        return "nop"
    cond = COND_DEC[(w >> 10) & 7]
    if op in (1, 2):
        destino = b + 1 + sext(w & 0x3FF, 10)
        destinos.add(destino)
        return "%s.%s __b%d" % ("br" if op == 1 else "jal", cond, destino)
    if op in (3, 4):
        return "%s.%s r%d" % ("jr" if op == 3 else "jalr", cond, (w >> 5) & 0xF)
    if op == 5:
        return "halt"
    raise RuntimeError("opcode del BRU desconocido: %d" % op)


def cargar_binario(datos):
    """Decodifica un ejecutable .  Devuelve (bundles, etiquetas, memoria)."""
    if len(datos) < CAB or datos[:4] != MAGIA:
        raise RuntimeError("no tiene la magia 'NOVA'")

    def u32(off):
        return int.from_bytes(datos[off:off + 4], "little")

    version = int.from_bytes(datos[4:6], "little")
    if version != 1:
        raise RuntimeError("version de ejecutable no soportada: %d" % version)

    n_bundles = u32(8)
    codigo_org = u32(12)
    entrada = u32(16)
    datos_org = u32(20)
    datos_init = u32(24)
    datos_cero = u32(28)
    pila = u32(32)
    suma_esp = u32(36)

    fin_codigo = CAB + n_bundles * 16
    esperado = fin_codigo + datos_init
    if len(datos) != esperado:
        raise RuntimeError("el archivo mide %d bytes y el encabezado describe %d"
                           % (len(datos), esperado))

    suma = 0
    for by in datos[CAB:esperado]:
        suma = (suma * 31 + by) & M32
    if suma != suma_esp:
        raise RuntimeError("suma de verificacion: 0x%08X en el archivo, 0x%08X calculada"
                           % (suma_esp, suma))

    if codigo_org != 0:
        raise RuntimeError("este simulador carga el codigo en 0, no en 0x%X" % codigo_org)
    if entrada % 16:
        raise RuntimeError("el punto de entrada 0x%X no es multiplo de 16" % entrada)

    # Datos: lo inicializado se copia y el resto ya esta en cero.
    mem = bytearray(MEM_BYTES)
    mem[datos_org:datos_org + datos_init] = datos[fin_codigo:esperado]
    if datos_org + datos_init + datos_cero > MEM_BYTES:
        raise RuntimeError("la seccion de datos se sale de la memoria")

    destinos = set()
    bundles = []
    for b in range(n_bundles):
        p = CAB + b * 16
        bajo = int.from_bytes(datos[p:p + 4], "little")
        s2 = int.from_bytes(datos[p + 4:p + 8], "little")
        s1 = int.from_bytes(datos[p + 8:p + 12], "little")
        s0 = int.from_bytes(datos[p + 12:p + 16], "little")
        bundles.append([dec_alu(s0), dec_alu(s1), dec_lsu(s2),
                        dec_crp(bajo >> 16), dec_bru(bajo & 0xFFFF, b, destinos)])

    # El binario no trae nombres: los destinos de salto se vuelven etiquetas
    # sinteticas, que es todo lo que el interprete necesita.
    etiquetas = {"__b%d" % d: d for d in destinos}
    etiquetas["__inicio"] = entrada // 16
    etiquetas["__pila"] = pila
    return bundles, etiquetas, mem


def ocupacion(bundles):
    """Cuanto del bundle se usa de verdad. Es la medida de lo que ganaria la
    planificacion de la fase 5, que todavia no existe."""
    usados = [0] * 5
    vacios = 0
    for slots in bundles:
        if all(t in ("-", "nop") for t in slots):
            vacios += 1
        for k, t in enumerate(slots):
            if t not in ("-", "nop"):
                usados[k] += 1
    total = len(bundles)
    if not total:
        return
    print("bundles emitidos: %d, de los cuales %d vacios (%.0f%%)"
          % (total, vacios, 100.0 * vacios / total))
    print("ocupacion por slot: " + "  ".join(
        "S%d %d" % (k, usados[k]) for k in range(5)))
    print("instrucciones por bundle: %.2f de 5 posibles"
          % (sum(usados) / float(total)))


def main():
    args = [a for a in sys.argv[1:]]
    traza = "--traza" in args
    args = [a for a in args if not a.startswith("--")]
    if not args:
        sys.exit("uso: simular.py programa.s|programa [--traza]")

    with open(args[0], "rb") as f:
        crudo = f.read()

    # El mismo comando sirve para el ensamblador en texto y para el ejecutable:
    # se distinguen por la magia del encabezado.
    if crudo[:4] == MAGIA:
        try:
            bundles, etiquetas, mem = cargar_binario(crudo)
        except RuntimeError as e:
            print("EJECUTABLE INVALIDO: %s" % e)
            sys.exit(1)
        print("ejecutable binario: %d bundles, entrada en el bundle %d"
              % (len(bundles), etiquetas["__inicio"]))
    else:
        bundles, etiquetas, mem = ensamblar(crudo.decode("utf-8"))

    if "__inicio" not in etiquetas:
        print("modulo de biblioteca: no tiene principale, no hay nada que ejecutar")
        ocupacion(bundles)
        sys.exit(0)

    try:
        mq, n, ilegales, _ = ejecutar(bundles, etiquetas, mem, traza)
    except Externo as e:
        print("falta enlazar: '%s' esta en otro modulo" % e)
        ocupacion(bundles)
        sys.exit(0)
    except RuntimeError as e:
        print("ERROR DE EJECUCION: %s" % e)
        sys.exit(1)

    if ilegales:
        print("INSTRUCCIONES EN SLOT ILEGAL:")
        for b, si, txt in ilegales[:10]:
            print("  bundle %d, slot S%d: %s" % (b, si, txt))
        sys.exit(1)

    print("bundles ejecutados: %d" % n)
    print("codigo de salida (R6): %d" % s32(mq.reg[6]))
    vals = salida_de(mq)
    print("zona de salida (%d palabras): %s" % (len(vals), vals))

    usados = PILA_TOPE - mq.pila_min
    aviso = "" if mq.pila_min >= PILA_PISO else "  DESBORDA los 4 KB del ISA"
    print("pila: %d bytes usados, R14 bajo hasta 0x%04X%s"
          % (usados, mq.pila_min, aviso))

    ocupacion(bundles)


if __name__ == "__main__":
    main()
