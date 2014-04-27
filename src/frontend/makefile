all: parser
lex: lex.c
	g++ -I. lex.yy.c -o lex
parser: parser.c lex.c
	g++ parser.tab.c lex.yy.c lexer_util.cpp -o parser
parser.c: parser.y
	bison -d parser.y
lex.c: lexer.l
	flex lexer.l