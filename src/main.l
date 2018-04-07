
%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%
"[" {
	return AC;
}
"]" {
	return FC;
}
", " {
	return VIR;
}
[0-9]+ {
	return INT;
}
[A-Za-z]+ {
	return STR;
}
\n { return EOL;}

. ;

%%

int yywrap() {
  return 1;
}
