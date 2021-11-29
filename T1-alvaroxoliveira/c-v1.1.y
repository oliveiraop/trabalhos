%{
#include <stdlib.h>
#include <stdio.h>

void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
}

int yylex();
%}

%token ID
%token NUM
%token SYM
%token KEY
%token ERROR

%%

program
: /* empty */
;

%%


