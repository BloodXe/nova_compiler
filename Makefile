CC = gcc
LEX_DIR := fase1_lexico
PARSE_DIR := fase2_sintactico
SEM_DIR := fase3_semantico
GEN_DIR := fase4_codigo
SCHED_DIR := fase5_calendarizado_vliw

BIN := novac
# -MMD -MP genera los .d con las dependencias de encabezados: cambiar un .h
# recompila lo que lo incluye. Sin esto, editar symtab.h dejaba objetos
# compilados contra estructuras distintas.
CFLAGS := -Wall -Wextra -g -MMD -MP -I$(LEX_DIR) -I$(PARSE_DIR) -I$(SEM_DIR) -I$(GEN_DIR) -I$(SCHED_DIR)

SRCS = main.c \
       $(LEX_DIR)/diag.c \
       $(PARSE_DIR)/ast.c \
       $(PARSE_DIR)/nova.tab.c \
       $(LEX_DIR)/lex.yy.c \
       $(SEM_DIR)/symtab.c \
       $(SEM_DIR)/semantic.c \
       $(GEN_DIR)/tac.c \
       $(GEN_DIR)/codegen.c
	   $(SCHED_DIR)/dag.c \
       $(SCHED_DIR)/scheduler.c

OBJS = $(SRCS:.c=.o)
DEPS = $(OBJS:.o=.d)

.PHONY: all prueba test depurar verificar clean limpiar

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

# Asegura que nova.tab.h exista antes de intentar compilar cualquier .o
$(OBJS): $(PARSE_DIR)/nova.tab.h

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.tab.h: $(PARSE_DIR)/nova.y
	bison -d -o $(PARSE_DIR)/nova.tab.c $<

$(LEX_DIR)/lex.yy.c: $(LEX_DIR)/nova.l $(PARSE_DIR)/nova.tab.h $(PARSE_DIR)/ast.h $(LEX_DIR)/diag.h
	flex -o $@ $<

prueba test: $(BIN)
	@sh test/run_tests.sh ./$(BIN)

# Depuracion por partes. Sin argumento corre todo; con F se elige el objetivo:
#   make depurar
#   make depurar F=fase3
depurar: $(BIN)
	@sh depurar.sh "$(F)"

# Informe completo de verificacion. Con B se corre un solo bloque:
#   make verificar
#   make verificar B=6
verificar: $(BIN)
	@sh verificar.sh "$(B)"

# Deja el arbol como viene del repositorio: solo fuentes. Los .o, los .d, lo
# que generan bison y flex, el ejecutable del compilador y cualquier
# ejecutable de CERBERO que haya quedado de una corrida manual.
clean:
	rm -f $(BIN) $(OBJS) $(DEPS) \
	      $(PARSE_DIR)/nova.tab.* $(PARSE_DIR)/nova.output $(LEX_DIR)/lex.yy.c
	@rm -f .tmp_* a.out factorial saludo traza mergesort multiplicacion \
	       bits_y_hex busqueda_matriz desplazamientos operadores matriz \
	       estadistica convolucion rango div_cero boveda cola
	@find . -maxdepth 1 -type f -name 'W0[0-9][0-9]_*' ! -name '*.*' -delete 2>/dev/null || true
	@find . -maxdepth 1 -type f -name 'E[0-9][0-9][0-9]_*' ! -name '*.*' -delete 2>/dev/null || true

limpiar: clean

-include $(DEPS)
