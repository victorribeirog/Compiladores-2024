%{
    #include <stdio.h>
    int yylex();
    void yyerror(char *);    
%}
%token NUM
%token VEZES
%token MAIS
%token MENOS
%token DIV
%token ENTER

%%
linha : linha expr ENTER        { printf("\n"); }
      | ;
expr  : NUM                     { printf("%d ", $1); }
      | expr MAIS expr          { printf("+"); }
      | expr MENOS expr         { printf("-"); }
      | expr VEZES expr         { printf("*"); }
      | expr DIV expr           { printf("/"); }
      ;
%%

int main (){
    yyparse();
    return 0;
}