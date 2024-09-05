digit [0-9]
letter [A-Za-z]
%{
    int count;
%}
%%
"#"({letter}|{digit})*  printf("%s\n", yytext);
.
\n
%%

int yywrap(){return 1;}

int main (void){
    yylex();
    return 0;
}