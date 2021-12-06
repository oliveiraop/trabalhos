%{
#include <stdlib.h>
#include <stdio.h>

void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
}

int yylex();
%}

%token CONST ELSE FOR IF INT VOID RETURN WHILE
%token ID NUM
%token PLUS MINUS MULT DIV ASSIGN
%token LESS LESS_EQUAL GREATER GREATER_EQUAL EQUAL NOT_EQUAL
%token SEMICOLON COMMA
%token L_PARENTHESIS R_PARENTHESIS L_BRACKET R_BRACKET L_BRACE R_BRACE
%token ERROR

%right THEN ELSE
%%

program
: declaration-list
;

declaration-list
: declaration-list declaration
| declaration
;

declaration
: var-declaration
| fun-declaration
| const-declaration
;

const-declaration
: CONST type-specifier ID ASSIGN expression-stmt
;

var-declaration
: type-specifier ID SEMICOLON
| type-specifier ID L_BRACKET NUM R_BRACKET SEMICOLON
;

type-specifier
: INT
| VOID
;

fun-declaration
: type-specifier ID L_PARENTHESIS params R_PARENTHESIS compound-stmt
;

params
: param-list
| VOID
;

param-list
: param-list COMMA param
| param
;

param
: type-specifier ID
| type-specifier ID L_BRACKET R_BRACKET
;

compound-stmt
: L_BRACE local-declarations statement-list R_BRACE
;

local-declarations
: local-declarations var-declaration
| /* empty */
;

statement-list
: statement-list statement
| /* empty */
;

statement
: expression-stmt
| compound-stmt
| selection-stmt
| iteration-stmt
| for-stmt
| return-stmt
;

expression-stmt
: expression SEMICOLON
| SEMICOLON
;

selection-stmt
: IF L_PARENTHESIS expression R_PARENTHESIS statement %prec THEN
| IF L_PARENTHESIS expression R_PARENTHESIS statement ELSE statement
;

iteration-stmt
: WHILE L_PARENTHESIS expression R_PARENTHESIS statement
;

for-stmt
: FOR L_PARENTHESIS expression SEMICOLON expression SEMICOLON expression R_PARENTHESIS statement
| FOR L_PARENTHESIS type-specifier expression SEMICOLON expression SEMICOLON expression R_PARENTHESIS statement
;

return-stmt
: RETURN SEMICOLON
| RETURN expression SEMICOLON
;

expression
: var ASSIGN expression
| simple-expression
;

var
: ID
| ID L_BRACKET expression R_BRACKET
;

simple-expression
: additive-expression relop additive-expression
| additive-expression
;

relop
: LESS_EQUAL
| LESS
| GREATER
| GREATER_EQUAL
| EQUAL
| NOT_EQUAL
;

additive-expression
: additive-expression addop term
| term
;

addop
: PLUS
| MINUS
;

term
: term mulop factor
| factor
;

mulop
: MULT
| DIV
;

factor
: L_PARENTHESIS expression R_PARENTHESIS
| var
| call
| NUM
;

call
: ID L_PARENTHESIS args R_PARENTHESIS
;

args
: arg-list
| /* empty */
;

arg-list
: arg-list COMMA expression
| expression
;

%%

int main() {
  if(yyparse() == 0) {
    printf("Programa válido.\n");
  }
  else {
    printf("Programa inválido.\n");
  }
}
