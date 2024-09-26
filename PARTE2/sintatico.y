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
%token T_FIMENQT
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

%%
programa
    : cabecalho variaveis T_INICIO lista_comandos T_FIMPROG
    ;

cabecalho
    : T_PROGRAMA T_IDENTIF
    ;

variaveis
    : 
    | declaracao variaveis
    ;

declaracao_variaveis
    : tipo lista_variaveis declaracao_variaveis
    | tipo lista_variaveis
    ;

tipo
    : T_INTEIRO
    | T_LOGICO
    ;

lista_variaveis
    : lista_variaveis T_IDENTIF
    | T_IDENTIF
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
    ;

escrita
    : T_ESCREVA expressao
    ;

repeticao
    : T_ENQUANTO expressao T_FACA lista_comandos T_FIMENQT
    ;

selecao
    : T_SE expressao T_ENTAO lista_comandos T_SENAO lista_comandos T_FIMSE
    ;

atribuicao
    : T_IDENTIF T_ATRIB expressao
    ;

expressao
    : expressao T_MAIS expressao
    | expressao T_MENOS expressao
    | expressao T_VEZES expressao
    | expressao T_DIV expressao
    | expressao T_MAIOR expressao
    | expressao T_MENOR expressao
    | expressao T_IGUAL expressao
    | expressao T_E expressao
    | expressao T_OU expressao
    | termo
    ;
%%

