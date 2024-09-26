%{
    #include <stdio.h>
    int yylex();
    void yyerror(char *);
    int valores[26];    
%}
%token NUM
%token VEZES
%token MAIS
%token MENOS
%token DIV
%token ENTER
%token ABRE
%token FECHA
%token VAR
%token RECEBE

//precedencia e associatividade das operacoes
%left MAIS MENOS
%left VEZES DIV


%%
linha : linha comando ENTER        
      | ;

comando : expr                  { printf("%d\n", $1); }
        | VAR RECEBE expr       { valores[$1] = $3; }
        ;

expr  : NUM                     { $$ = $1; }
      | VAR                     { $$ = valores[$1]; }
      | expr MAIS expr          { $$ = $1 + $3; }
      | expr MENOS expr         { $$ = $1 - $3; }
      | expr VEZES expr         { $$ = $1 * $3; }
      | expr DIV expr           { $$ = $1 / $3; }
      | ABRE expr FECHA         { $$ = $2; }
      ;
%%

int main (){
    yyparse();
    return 0;
}