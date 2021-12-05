%option noyywrap yylineno

%{

#include "c-v1.1.tab.h"

%}

id                         [A-Za-z]([A-Za-z]|[0-9])*
numbers                    [0-9]+
inlinecomment              \/\/.*
blank                      [ \t\n]+

%%

{inlinecomment}             { /* nothing */ }
{blank}                     { /* nothing */ }

else                        { return (ELSE); }
if                          { return (IF); }
int                         { return (INT); }
return                      { return (RETURN); }
void                        { return (VOID); }
while                       { return (WHILE); }
const                       { return (CONST); }
for                         { return (FOR); }

{id}                        { return (ID); }
{numbers}                   { return (NUM); }

"+"                         { return (PLUS); }
"-"                         { return (MINUS); }
"*"                         { return (MULT); }
"/"                         { return (DIV); }

"="                         { return (ASSIGN); }
"<"                         { return (LT); }
">"                         { return (GT); }

"<="                        { return (LE); }
">="                        { return (GE); }
"=="                        { return (EQ); }
"!="                        { return (NE); }

";"                         { return (SEMICOLON); }
","                         { return (COMMA); }
"("                         { return (LPAREN); }
")"                         { return (RPAREN); }
"{"                         { return (LBRACE); }
"}"                         { return (RBRACE); }
"["                         { return (LBRACK); }
"]"                         { return (RBRACK); }

.                           { return (ERROR); }


%%

int main(int argc, char **argv) {
   yyparse();
   return 0;
}