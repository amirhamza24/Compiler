%{
#include "y.tab.h"

extern int lexval;
%}

%%

"print" {return PRINT;}
[0-7] {yylval = atoi(yytext); return NUMBER;}

[ \t]+ {}
'\n' {return 0;}
. {return yytext[0];}
%%