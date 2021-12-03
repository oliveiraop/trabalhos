/*
 * Definição  do flex.
 * Autores: João, Mauricio, Osmar
 */

%option noyywrap yylineno
%{
#include "c-v1.1.tab.h"
%}

%%

"//".*                      { /* no action */ }
else                        { return keyelse; }
if                          { return keyif; }
int                         { return keyint; }
return                      { return keyreturn; }
void                        { return keyvoid; }
while                       { return keywhile; }
const                       { return keyconst; }
for                         { return keyfor; }
[A-Za-z]([A-Za-z]|[0-9])*   { return ID; }
[0-9]+                      { return NUM; }
"+"                   { return plus; }
"-"                   { return minus; }
"/"                   { return division; }
"*"                   { return mult; }
";"                   { return semicolon; }
"("                   { return oparent; }
")"                   { return cparent; }
"="                   { return equal; }
"{"                   { return okey; }
"}"                   { return ckey; }
"<"                   { return lessthan; }
"<="                  { return lessequal; }
">"                   { return biggerthan; }
">="                  { return biggerequal; }
"=="                  { return equalequal; }
","                   { return colon; }
"["                   { return obrackets; }
"]"                   { return cbrackets; }
"!="                  { return notequal; }

[ \t\n]                       { /* no action */ }
.                           { return ERROR; }


%%

int main(int argc, char **argv) {
    int token;

    while ((token = yylex())) {
        switch (token) {
         case ERROR:
            printf("(%d,ERROR,\"%s\")\n", yylineno, yytext);
            break;
         case keyelse:
            printf("(%d,keyelse,\"%s\")\n", yylineno, yytext);
            break;
         case NUM:
            printf("(%d,NUM,\"%s\")\n", yylineno, yytext);
            break;
         case ID:
            printf("(%d,ID,\"%s\")\n", yylineno, yytext);
            break;
        }
    }

    if (yyparse() == 0) {
        fprintf(stdout, "Sem erros sintáticos\n");
    } else {
        fprintf(stdout, "Erros\n");
    }
}

