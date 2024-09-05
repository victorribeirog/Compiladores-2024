%{
    int nlet, npal, nlin;
%}

%%
\n          {nlin++; nlet++; }
[^ \t\n]+   {npal++; nlet += yyleng; }
.           {nlet++; }
%%

int yywrap() {return 1; }

int main(){
    yylex();
    printf("Numero de carecteres %d\n", nlet);
    printf("Numero de carecteres %d\n", npal);
    printf("Numero de carecteres %d\n", nlin);
    return 0;
}