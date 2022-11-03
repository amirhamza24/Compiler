%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(const char *s){
	fprintf(stderr,"%s\n",s);
}
extern FILE *yyin;
int yylex();

%}

%token NUMBER PRINT
%%

N:L {printf("%d\n",$1);};
L : L B { $$ = $1 * 8 + $2; }
	|B {$$ = $1;}
	;
B : NUMBER {
	$$ = $1;
};




%%
int main(){
	FILE *file;
	file = fopen("code.c", "r") ;
	if (!file) {
		printf("couldnot open file");
		exit (1);	
	}
	else {
		yyin = file;
	}
	yyparse();
}

