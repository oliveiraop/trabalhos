%define parse.error verbose
%define parse.trace

%{
    
#include <stdlib.h>
#include <stdio.h>

extern int yylineno;
extern char *yytext;

void yyerror(const char* msg) {
    printf("An error occurred on line %d, near \"%s\": %s\n", yylineno, yytext, msg); 
}

int yylex();

%}

%token ELSE
%token IF
%token INT
%token RETURN
%token VOID
%token WHILE
%token CONST
%token FOR

%token ID
%token NUM

%token PLUS
%token MINUS
%token MULT
%token DIV
%token ASSIGN

%token LT
%token GT
%token LE
%token GE
%token EQ
%token NE

%token SEMICOLON
%token COMMA
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token LBRACK
%token RBRACK

%token ERROR

%%

program: declaration-list
    | %empty
;

declaration-list: declaration-list declaration 
    | declaration
;

declaration: var-declaration 
    | fun-declaration 
    | const-declaration
;

var-declaration: type-specifier ID SEMICOLON 
    | type-specifier ID LBRACK NUM RBRACK SEMICOLON
;

type-specifier: INT 
    | VOID
;

fun-declaration: type-specifier ID LPAREN params RPAREN compound-stmt
;

const-declaration: CONST type-specifier ID ASSIGN NUM SEMICOLON
;

params: param-list 
    | VOID
;

param-list: param-list COMMA param 
    | param
;

param: type-specifier ID 
    | type-specifier ID LBRACK RBRACK 
;

compound-stmt: LBRACE local-declarations statement-list RBRACE
;

local-declarations: local-declarations var-declaration
    | %empty
;

statement-list: statement-list statement
    | %empty
;

statement: expression-stmt 
    | compound-stmt 
    | selection-stmt 
    | iteration-stmt 
    | return-stmt
;

expression-stmt: expression SEMICOLON 
    | SEMICOLON
;

selection-stmt: IF LPAREN expression RPAREN statement 
    | IF LPAREN expression RPAREN statement ELSE statement
;

iteration-stmt: WHILE LPAREN expression RPAREN statement
    | FOR LPAREN expression-stmt expression-stmt expression RPAREN statement
;

return-stmt: RETURN SEMICOLON 
    | RETURN expression SEMICOLON
;

expression: var ASSIGN expression 
    | simple-expression
;

var: ID 
    | ID LBRACK expression RBRACK
;

simple-expression: additive-expression relop additive-expression 
    | additive-expression
;

relop: LE 
    | LT 
    | GE 
    | GT 
    | EQ 
    | NE
;

additive-expression: additive-expression addop term 
    | term
;

addop: PLUS 
    | MINUS
;

term: term mulop factor 
    | factor
;

mulop: MULT 
    | DIV
;

factor: LPAREN expression RPAREN 
    | var 
    | call 
    | NUM
;

call: ID LPAREN args RPAREN
;

args: arg-list 
    | %empty
;

arg-list: arg-list COMMA expression 
    | expression
;

%%
