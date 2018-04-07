

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}
%token INT STR EOL AC FC VIR

%%

PROGRAMA:
	PROGRAMA EXPRESSAO EOL	
	|;
EXPRESSAO:
	INT
	|
	STR
	|
	AC EXPRESSAO FC 
	|
	AC EXPRESSAO VIR
	|
	EXPRESSAO FC 
	|
	EXPRESSAO VIR
	|
	EXPRESSAO EXPRESSAO
	|
	AC FC
;



%%

void yyerror(char *s) {
	printf("ERRO\n");
}

int main() {
  yyparse();
	printf("OK\n");
    return 0;

}
