/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_C_V1_1_TAB_H_INCLUDED
# define YY_YY_C_V1_1_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    KEYELSE = 258,
    KEYIF = 259,
    KEYINT = 260,
    KEYRETURN = 261,
    KEYVOID = 262,
    KEYWHILE = 263,
    KEYCONST = 264,
    KEYFOR = 265,
    ID = 266,
    NUM = 267,
    PLUS = 268,
    MINUS = 269,
    DIVISION = 270,
    MULT = 271,
    SEMICOLON = 272,
    OPARENT = 273,
    CPARENT = 274,
    EQUAL = 275,
    OKEY = 276,
    CKEY = 277,
    LESSTHAN = 278,
    LESSEQUAL = 279,
    GREATERTHAN = 280,
    GREATEREQUAL = 281,
    EQUALEQUAL = 282,
    COLON = 283,
    OBRACKETS = 284,
    CBRACKETS = 285,
    NOTEQUAL = 286,
    THEN = 287,
    ELSE = 288
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 15 "c-v1.1.y" /* yacc.c:1909  */

  struct decl *decl;
  struct stmt *stmt;
  struct expr *expr;
  struct type *type;
  struct param_list *plist;
  char *name;
  int d;

#line 98 "c-v1.1.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_C_V1_1_TAB_H_INCLUDED  */
