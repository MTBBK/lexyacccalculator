%{
#include <stdio.h>
#include <math.h>
#define YYSTYPE float
float result = 0.0;
int yylex(void);
void yyerror(const char *str);
%}

%token PLUS MINUS TIMES DIVIDE POWERA POWERB NUMBER LPAREN RPAREN
%left PLUS MINUS
%left TIMES DIVIDE
%right POWERA POWERB
%%
line	: expr { result = $1; printf("%f\n", result); }
	;
		
expr		: expr PLUS expr { $$ = $1+$3; } 
		| expr MINUS expr { $$ = $1-$3; } 
		| expr TIMES expr { $$ = $1*$3; } 
		| expr DIVIDE expr { if($3 == 0){yyerror("Cannot divided by zero");} else { $$ = $1/$3; }} 
		| expr POWERA expr { $$ = pow($1, $3); } 
		| expr POWERB expr { $$ = pow($1, $3); } 
		| LPAREN expr RPAREN { $$ = $2; } 
		| NUMBER { $$ = $1; } 
%%

void yyerror(const char* str){
	fprintf(stderr, "Error: %s\n", str);
}

int main(){
yyparse();
return 0;
}
