LEX_DIR := fase1_lexico
PARSE_DIR := fase2_sintactico
BIN := novac_parser
CFLAGS := -Wall -Wextra -g -I$(LEX_DIR) -I$(PARSE_DIR)

$(BIN): $(PARSE_DIR)/nova.tab.c $(LEX_DIR)/lex.yy.c $(PARSE_DIR)/ast.c $(LEX_DIR)/diag.c main.c $(PARSE_DIR)/ast.h $(LEX_DIR)/diag.h
	gcc $(CFLAGS) $(PARSE_DIR)/nova.tab.c $(LEX_DIR)/lex.yy.c $(PARSE_DIR)/ast.c $(LEX_DIR)/diag.c main.c -o $(BIN)

$(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.tab.h: $(PARSE_DIR)/nova.y
	bison -d -o $(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.y

$(LEX_DIR)/lex.yy.c: $(LEX_DIR)/nova.l $(PARSE_DIR)/nova.tab.h
	flex -o $(LEX_DIR)/lex.yy.c $(LEX_DIR)/nova.l

clean:
	rm -f $(BIN) $(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.tab.h $(LEX_DIR)/lex.yy.c *.o