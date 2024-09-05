%{
    int nlin = 0;
%}
%%
^(.*)\n printf("%4d: %s", ++nlin, yytext);
%%

int yywrap(){ return 1;}

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}