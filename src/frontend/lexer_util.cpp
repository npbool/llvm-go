#include <cstdlib>
#include "lexer_util.h"

int parse_int_literal(const char* str){
	int res = atoi(str);
	return res;
}

double parse_float_literal(const char* str){
	double res = atof(str);
	return res;
}