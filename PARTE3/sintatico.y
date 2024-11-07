%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lexico.c"
#include "utils.c"

int contaVar = 0;
int tipo;
%}

%token T_PROGRAMA
%token T_INICIO
%token T_FIMPROG
%token T_LEIA
%token T_ESCREVA
%token T_SE
%token T_ENTAO
%token T_SENAO
%token T_FIMSE
%token T_ENQUANTO
%token T_FACA
%token T_FIMENQTO
%token T_MAIS
%token T_MENOS
%token T_VEZES
%token T_DIV
%token T_MAIOR
%token T_MENOR
%token T_IGUAL
%token T_E
%token T_OU
%token T_NAO
%token T_ATRIB
%token T_ABRE
%token T_FECHA
%token T_INTEIRO
%token T_LOGICO
%token T_V
%token T_F
%token T_IDENTIF
%token T_NUMERO

%start programa

%left T_MAIS T_MENOS
%left T_VEZES T_DIV
%left T_MAIOR T_MENOR T_IGUAL     
%left T_E T_OU 

%%
programa
    : cabecalho 
        { 
            printf("\tINPP\n");
            contaVar = 0; 
        }
      variaveis
        { printf("\tAMEM\t%d\n", contaVar); } 
      T_INICIO lista_comandos T_FIMPROG
        { printf("\tDMEM\t%d\n\tFIMP\n", contaVar); }
    ;

cabecalho
    : T_PROGRAMA T_IDENTIF
    ;

variaveis
    : 
    | declaracao_variaveis
    ;

declaracao_variaveis
    : tipo lista_variaveis declaracao_variaveis
    | tipo lista_variaveis
    ;

tipo
    : T_INTEIRO { tipo = INT; }
    | T_LOGICO  { tipo = LOG; }
    ;

lista_variaveis
    : lista_variaveis T_IDENTIF
        {
            strcpy (elemTab.id, atomo);
            elemTab.end = contaVar;
            elemTab.tip = tipo;
            insereSimbolo(elemTab);
            contaVar++; 
        }
    | T_IDENTIF
        {
            strcpy (elemTab.id, atomo);
            elemTab.end = contaVar;
            elemTab.tip = tipo;
            insereSimbolo(elemTab);
            contaVar++; 
        }
    ;

lista_comandos
    : lista_comandos comando
    | comando
    ;

comando
    : leitura
    | escrita
    | repeticao
    | selecao
    | atribuicao
    ;

leitura
    : T_LEIA T_IDENTIF
        { 
            int pos = buscaSimbolo(atomo);
            printf("\tLEIA\n");
            printf("\tARZG\t%d\n", tabSimb[pos].end); 
        }
    ;

escrita
    : T_ESCREVA expressao
        { printf("\tESCR\n"); }
    ;

repeticao
    : T_ENQUANTO expressao T_FACA lista_comandos T_FIMENQTO
    ;

selecao
    : T_SE expressao T_ENTAO lista_comandos T_SENAO lista_comandos T_FIMSE
    ;

atribuicao
    : T_IDENTIF T_ATRIB expressao
    ;

expressao
    : expressao T_MAIS expressao    { printf("\tSOMA\n");}
    | expressao T_MENOS expressao   { printf("\tSUBT\n");}
    | expressao T_VEZES expressao   { printf("\tMULT\n");}
    | expressao T_DIV expressao     { printf("\tDIVI\n");}
    | expressao T_MAIOR expressao   { printf("\tCMMA\n");}
    | expressao T_MENOR expressao   { printf("\tCMME\n");}
    | expressao T_IGUAL expressao   { printf("\tCMIG\n");}
    | expressao T_E expressao       { printf("\tCONJ\n");}
    | expressao T_OU expressao      { printf("\tDISJ\n");}
    | termo
    ;

termo
    : T_NUMERO      { printf("\tCRCT\t%s\n", atomo);}
    | T_IDENTIF     
        { 
            int pos = buscaSimbolo(atomo);
            printf("\tCRVG\t%d\n", tabSimb[pos].end);
        }
    | T_V           { printf("\tCRCT\t1\n");}
    | T_F           { printf("\tCRCT\t0\n");}
    | T_NAO termo   { printf("\tNEGA\n");}
    | T_ABRE expressao T_FECHA
    ;
%%

int main (){
    yyparse();
    puts("Programa ok!");
    return 0;
}

