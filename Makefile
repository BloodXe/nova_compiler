CC = gcc
LEX_DIR := fase1_lexico
PARSE_DIR := fase2_sintactico
SEM_DIR := fase3_semantico

BIN := novac
CFLAGS := -Wall -Wextra -g -I$(LEX_DIR) -I$(PARSE_DIR) -I$(SEM_DIR)

SRCS = main.c \
       $(LEX_DIR)/diag.c \
       $(PARSE_DIR)/ast.c \
       $(PARSE_DIR)/nova.tab.c \
       $(LEX_DIR)/lex.yy.c \
       $(SEM_DIR)/symtab.c \
       $(SEM_DIR)/semantic.c

OBJS = $(SRCS:.c=.o)

.PHONY: all prueba test clean limpiar

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(PARSE_DIR)/nova.tab.c $(PARSE_DIR)/nova.tab.h: $(PARSE_DIR)/nova.y
	bison -d -o $(PARSE_DIR)/nova.tab.c $<

$(LEX_DIR)/lex.yy.c: $(LEX_DIR)/nova.l $(PARSE_DIR)/nova.tab.h $(PARSE_DIR)/ast.h $(LEX_DIR)/diag.h
	flex -o $@ $<

prueba test: $(BIN)
	@sh test/run_tests.sh ./$(BIN)

clean:
	rm -f $(BIN) $(OBJS) $(PARSE_DIR)/nova.tab.* $(PARSE_DIR)/nova.output $(LEX_DIR)/lex.yy.c

limpiar: clean
