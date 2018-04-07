

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int error=0;
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
	error=1;
	printf("ERRO\n");
}

int main() {
  yyparse();
	if(error==0){
	printf("OK\n");
	error=0;
}
    return 0;

}
