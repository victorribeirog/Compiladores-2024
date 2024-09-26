calc: calc.l calc.y;
	  flex -o lex.c calc.l;\
	  bison -v -d calc.y -o calc.c;\
	  gcc lex.c calc.c -o calc;

limpa:;
	  rm lex.c calc.c calc.h calc.output calc