LEX_DIR := fase1_lexico
PARSE_DIR := fase2_sintactico
BIN := novac
CFLAGS := -Wall -Wextra -g -I$(LEX_DIR) -I$(PARSE_DIR)

.PHONY: all prueba test clean limpiar

all: $(BIN)

$(BIN): $(PARSE_DIR)/nova.tab.c $(LEX_DIR)/lex.yy.c $(PARSE_DIR)/ast.c $(LEX_DIR)/diag.c main.c $(PARSE_DIR)/ast.h $(LEX_DIR)/diag.h
	gcc $(CFLAGS) $(PARSE_DIR)/nova.tab.c $(LEX_DIR)/lex.yy.c $(PARSE_DIR)/ast.c $(LEX_DIR)/diag.c main.c -o $(BIN)

$(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.tab.h: $(PARSE_DIR)/nova.y
	bison -d -o $(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.y

$(LEX_DIR)/lex.yy.c: $(LEX_DIR)/nova.l $(PARSE_DIR)/nova.tab.h $(PARSE_DIR)/ast.h $(LEX_DIR)/diag.h
	flex -o $(LEX_DIR)/lex.yy.c $(LEX_DIR)/nova.l

# Corre el analizador sobre todos los ejemplos y verifica los diagnosticos.
prueba test: $(BIN)
	@sh test/run_tests.sh ./$(BIN)

clean:
	rm -f $(BIN) novac_parser $(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.tab.h $(PARSE_DIR)/nova.output $(LEX_DIR)/lex.yy.c *.o

limpiar: clean
