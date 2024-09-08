identificador   [a-zA-Z]([a-zA-Z0-9])*
numero          [0-9]*
espaco          [\t\r]*
novalinha       [\n]

%%
programa            printf("%11s: reservado\n", yytext);
inicio              printf("%11s: reservado\n", yytext);
fimprograma         printf("%11s: reservado\n", yytext);
leia                printf("%11s: reservado\n", yytext);
escreva             printf("%11s: reservado\n", yytext);
se                  printf("%11s: reservado\n", yytext);
entao               printf("%11s: reservado\n", yytext);
senao               printf("%11s: reservado\n", yytext);
fimse               printf("%11s: reservado\n", yytext);
enquanto            printf("%11s: reservado\n", yytext);
faca                printf("%11s: reservado\n", yytext);
fimenquanto         printf("%11s: reservado\n", yytext);


"+"                 printf("%11s: op.soma\n", yytext);
"-"                 printf("%11s: op.subtracao\n", yytext);
"*"                 printf("%11s: op.multiplicacao\n", yytext);
div                 printf("%11s: op.divisao\n", yytext);

">"                 printf("%11s: op.maior\n", yytext);
"<"                 printf("%11s: op.menor\n", yytext);
"="                 printf("%11s: op.igual\n", yytext);

e                   printf("%11s: op.conjuncao\n", yytext);
ou                  printf("%11s: op.disjuncao\n", yytext);
nao                 printf("%11s: op.negacao\n", yytext);

"<-"                printf("%11s: op.atribuicao\n", yytext);
"("                 printf("%11s: abre\n", yytext);
")"                 printf("%11s: fecha\n", yytext);

inteiro             printf("%11s: tipo:inteiro\n", yytext);
logico              printf("%11s: tipo:logico\n", yytext);
V                   printf("%11s: cte:verdadeiro\n", yytext);
F                   printf("%11s: cte:falso\n", yytext);

{identificador}     printf("%11s: identificador\n", yytext);
{numero}            printf("%11s: numero\n", yytext);
{espaco}            /*nada*/
{novalinha}         /*nada*/

%%

int yywrap() {return 1;}
int main(){
    yylex();
    return 0;
}