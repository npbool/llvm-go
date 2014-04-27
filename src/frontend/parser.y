%{
	#include <iostream>
	#include <cstdio>
	using namespace std;

	extern int yylex();
	extern void yyerror(char* s);
	void yyerror (char const *);  
%}

%union
{
    int intValue;
    double floatValue;
    char *stringValue;
}

%token IF ELSE FOR GOTO BREAK CONTINUE 
%token SWITCH CASE RANGE DEFAULT
%token FUNC RETURN
%token MAP VAR CONST
%token IMPORT PACKAGE
%token TYPE STRUCT INTERFACE
%token SELECT GO CHAN DEFER FALLTHROUGH

%token '+' '-' '*' '/' '%' '&' '|' '^' 
%token '(' ')' '[' ']' '{' '}'
%token '<' '>' '='  '!' ';' ':' ',' '.' 
%token PLUS_ASSIGN MINUS_ASSIGN OR_ASSIGN AND_ASSIGN XOR_ASSIGN DIV_ASSIGN MUL_ASSIGN MOD_ASSIGN EQUAL
%token LOGIC_AND LOGIC_OR
%token SELF_PLUS SELF_MINUS
%token ALLOC
%token IDENTIFIER

%token INT_LIT FLOAT_LIT STRING_LIT IMAGINARY_LIT
%%

Operand			:	Literal {

				}
Literal			:	BasicLit {

				}
BasicLit		:	INT_LIT {
					printf("INTLIT %d\n", yylval.intValue);
				}
				|	FLOAT_LIT {
					printf("FLOAT_LIT %lf\n", yylval.floatValue);
				}
				|	STRING_LIT {

				}
OperandName		:	IDENTIFIER {
					printf("OPNAME %s\n", yylval.floatValue);
				}


%%

void yyerror (char const *s )  
{ 
printf( "%s" , s ); 
} 

int main(){
	yyparse();
} 