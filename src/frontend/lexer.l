%{
#include <iostream>
#include <cstdio>	
#include "parser.tab.h"
#include "lexer_util.h"
using namespace std;

%}

%option noyywrap


NEWLINE				(\r|\n|\r\n)
DEC_DIGIT 			([0-9])
OCT_DIGIT			([0-7])
HEX_DITIT			([0-9A-Fa-f])
LETTER				([0-9A-Za-z]|_)
IDENTIFIER			({LETTER}{LETTER}*)
SIMPLE_OP			("+"|"-"|"*"|"/"|"%"|"="|"&"|"|"|"^"|"<"|">"|"."|","|":"|";"|"!"|"{"|"}"|"("|")"|"["|"]")
WHITESPACE			([ \t]+)

INT_LIT				({DEC_LIT}|{OCT_LIT}|{HEX_LIT})
DEC_LIT				([1-9]{DEC_DIGIT}*)
OCT_LIT				(0{OCT_DIGIT}+)
HEX_LIT				(0[Xx]{HEX_DITIT}+)

FLOAT_LIT			({DECIMALS}"."{DECIMALS}?{EXPONENT}?|{DECIMALS}{EXPONENT}|"."{DECIMALS}{EXPONENT})
DECIMALS			({DEC_DIGIT}+)
EXPONENT			([eE][+-]?{DECIMALS})

IMGINARY_LIT		(({DECIMALS}|{FLOAT_LIT})"i")

%%

{WHITESPACE}		{}

"break"			{ return BREAK; } 
"default"			{ return DEFAULT; }       
"func"			{ return FUNC; }
"interface"		{ return INTERFACE; }    
"select"			{ return SELECT; }
"case"			{ return CASE; }         
"defer"			{ return DEFER; }         
"go" 				{ return GO; }           
"map" 			{ return MAP; }          
"struct"			{ return STRUCT; } 
"chan" 			{ return CHAN; }          
"else"			{ return ELSE; }         
"goto" 			{ return GOTO; }          
"package"			{ return PACKAGE; }       
"switch" 			{ return SWITCH; }  
"const" 			{ return CONST; }        
"fallthrough" 	{ return FALLTHROUGH; }   
"if" 				{ return IF; }           
"range"  			{ return RANGE; }        
"type" 			{ return TYPE; } 
"continue" 		{ return CONTINUE; }      
"for" 			{ return FOR; }           
"import"			{ return IMPORT; }       
"return" 			{ return RETURN; }       
"var" 			{ return VAR; } 

{SIMPLE_OP}		{ printf("OP %c\n", yytext[0]); return yytext[0];}
"++"			{ return SELF_PLUS; }
"--"			{ return SELF_MINUS; }
"&&"			{ return LOGIC_AND; }
"||"			{ return LOGIC_OR; }
"+="			{ return PLUS_ASSIGN; }
"-="			{ return MINUS_ASSIGN; }
"*="			{ return MUL_ASSIGN; }
"/="			{ return DIV_ASSIGN; }
"|="			{ return OR_ASSIGN; }
"&="			{ return AND_ASSIGN; }
"^="			{ return XOR_ASSIGN; }
":="			{ return ALLOC; }

{IMGINARY_LIT}	{ yylval.floatValue = parse_float_literal(yytext); return IMAGINARY_LIT;  }
{INT_LIT}		{ yylval.intValue = parse_int_literal(yytext); return INT_LIT; }
{FLOAT_LIT}		{ yylval.floatValue = parse_float_literal(yytext); return FLOAT_LIT; }

{IDENTIFIER}	{ yylval.stringValue = yytext; return IDENTIFIER; }
%%

