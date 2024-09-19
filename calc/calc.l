%{
#include "calc.h"    
%}
%%
[0-9]+   { yylval = atoi(yytext); return NUM; }
"*"      { return VEZES; }
"+"      { return MAIS; }
"-"      { return MENOS; }
"/"      { return DIV; }
[ \t\r]+ ;
\n       { return ENTER; }
.        yyerror("Erro lexico");
%%

void yyerror (char *s){
    puts(s);
}

int yywrap(){ return 1; }