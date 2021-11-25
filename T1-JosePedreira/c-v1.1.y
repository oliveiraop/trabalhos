// base com bison para declaração de tokens

/* 
 * Template de programa bison para a linguagem E1.
 * Serve apenas para definir tokens associados ao analisador léxico implentado com flex.
 * Executar  'bison -d e1.y' para gerar arquivos e1.tab.c e e1.tab.h.
 * Template de programa bison E1 atividade
 *  
 *
 */
%{
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>


extern int yylineno;

#define YYSTYPE char *
int yylex();

void yyerror(const char *s);

int yydebug = 1;
int indent  = 0;
char *iden_dum;

%}

//TOKENS DEFINITION

%token KEY
%token NUM
%token ID
%token SYM
%token ERROR


// REGRAS GRAMATICAIS

%%
program:

int main(void){
    yyparse ();
}

%%


