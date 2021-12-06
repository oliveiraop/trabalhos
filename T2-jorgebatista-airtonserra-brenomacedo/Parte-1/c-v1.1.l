%option noyywrap yylineno
%{
#include "c-v1.1.tab.h"
%}

%%

"//".*                      { /* no action */ }

const                       { return CONST; }
else                        { return ELSE; }
for                         { return FOR; }
if                          { return IF; }
int                         { return INT; }
void                        { return VOID; }
return                      { return RETURN; }
while                       { return WHILE; }


[A-Za-z]([A-Za-z_]|[0-9])*   { return ID; }
[0-9]+                      { yylval = atoi(yytext); return NUM; }

"+"                         { return PLUS; }
"-"                         { return MINUS; }
"*"                         { return MULT; }
"/"                         { return DIV; }
"="                         { return ASSIGN; }

"<"                         { return LESS; }
"<="                        { return LESS_EQUAL; }
">"                         { return GREATER; }
">="                        { return GREATER_EQUAL; }
"=="                        { return EQUAL; }
"!="                        { return NOT_EQUAL; }

";"                         { return SEMICOLON; }
","                         { return COMMA; }

"("                         { return L_PARENTHESIS; }
")"                         { return R_PARENTHESIS; }
"["                         { return L_BRACKET; }
"]"                         { return R_BRACKET; }
"{"                         { return L_BRACE; }
"}"                         { return R_BRACE; }

[ \t\n]                       { /* no action */ }

.                           { return ERROR; }


%%
