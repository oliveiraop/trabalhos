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
else                        { return KEYELSE; }
if                          { return KEYIF; }
int                         { return KEYINT; }
return                      { return KEYRETURN; }
void                        { return KEYVOID; }
while                       { return KEYWHILE; }
const                       { return KEYCONST; }
for                         { return KEYFOR; }
[A-Za-z]([A-Za-z]|[0-9])*   { return ID; }
[0-9]+                      { return NUM; }
"+"                         { return PLUS; }
"-"                         { return MINUS; }
"/"                         { return DIVISION; }
"*"                         { return MULT; }
";"                         { return SEMICOLON; }
"("                         { return OPARENT; }
")"                         { return CPARENT; }
"="                         { return EQUAL; }
"{"                         { return OKEY; }
"}"                         { return CKEY; }
"<"                         { return LESSTHAN; }
"<="                        { return LESSEQUAL; }
">"                         { return BIGGERTHAN; }
">="                        { return BIGGEREQUAl; }
"=="                        { return EQUALEQUAL; }
","                         { return COLON; }
"["                         { return OBRACKETS; }
"]"                         { return CBRACKETS; }
"!="                        { return NOTEQUAL; }

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

