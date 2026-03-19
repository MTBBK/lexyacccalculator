%{
#define YYSTYPE float
#include <stdio.h>
#include <math.h>
#include "y.tab.h"
extern float result;
%}
%%
[0-9]+ yylval=atoi(yytext); return NUMBER; 
[\t] ;
[\n] return 0;
"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;
"**" return POWERA;
"^" return POWERB;
"(" return LPAREN;
")" return RPAREN;
"Naber" printf("-İyi, senden naber\n");
%%

int yywrap(void){
return 1;
}
