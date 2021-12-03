%{
#include <stdlib.h>
#include <stdio.h>


extern int yylineno;

extern char* yytext;

void yyerror(const char* msg) {
      fprintf(stderr, "Erro sintático na linha %d char: %s\n", yylineno, yytext);
}

int yylex();
%}

%token ERROR
%token keyelse
%token keyif
%token keyint
%token keyreturn
%token keyvoid
%token keywhile
%token keyconst
%token keyfor
%token ID
%token NUM
%token plus
%token minus
%token division
%token mult
%token semicolon
%token oparent
%token cparent
%token equal
%token okey
%token ckey
%token lessthan
%token lessequal
%token biggerthan
%token biggerequal
%token equalequal
%token colon
%token obrackets
%token cbrackets
%token notequal

%%

program : declarationList;

declarationList : declarationList declaration | declaration;

declaration : varDeclaration | funDeclaration;

varDeclaration : typeSpecifier ID semicolon
               | typeSpecifier ID obrackets NUM cbrackets semicolon
               ;

typeSpecifier : keyint
              | keyvoid
              ;

funDeclaration : typeSpecifier ID oparent params cparent compoundStmt;

params : paramList
       | keyvoid
       ;

paramList : paramList colon param
          | param
          ;

param : typeSpecifier ID
      | typeSpecifier ID obrackets cbrackets
      ;

compoundStmt : okey localDeclarations statementList ckey
             ;

localDeclarations : localDeclarations varDeclaration
                  |
                  ;

statementList : statementList statement
              |
              ;

statement : expressionStmt
          | compoundStmt
          | selectionStmt
          | iterationStmt
          | returnStmt
          ;

expressionStmt : expression semicolon
               | semicolon
               ;

selectionStmt : keyif oparent expression cparent statement
              | keyif oparent expression cparent statement keyelse statement
              ;

iterationStmt : keywhile oparent expression cparent statement;

returnStmt : keyreturn semicolon
           | keyreturn expression semicolon
           ;

expression : var equal expression
           | simpleExpression
           ;

var : ID
    | ID obrackets expression cbrackets
    ;

simpleExpression : additiveExpression relop additiveExpression
                 | additiveExpression
                 ;

relop : lessequal
      | lessthan
      | biggerthan
      | biggerequal
      | equalequal
      | notequal
      ;

additiveExpression : additiveExpression addop term
                   | term
                   ;

addop : plus
      | minus
      ;

term : term mulop factor
     | factor
     ;

mulop : mult
      | division
      ;
factor : oparent expression cparent
       | var
       | call
       | NUM
       ;

call : ID oparent args cparent;

args : argList
     |
     ;

argList : argList colon expression
        | expression
        ;

%%