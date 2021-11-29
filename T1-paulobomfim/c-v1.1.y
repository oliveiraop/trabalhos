/* PROGRAMA BISON */
/* Paulo Bomfim - 201523044 */
/* MATA61 - 2021.2 */

%{
/* includes, C defs */

#include <stdio.h>

void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
}

int yylex();
%}


%token ERROR
%token ID
%token KEY
%token NUM
%token SYM

%%

program
      : /* do nothing */
      ;

%%