/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_SYNTAX_TAB_H_INCLUDED
# define YY_YY_SYNTAX_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    debut = 258,                   /* debut  */
    execution = 259,               /* execution  */
    start_block = 260,             /* start_block  */
    end_block = 261,               /* end_block  */
    fin = 262,                     /* fin  */
    t_real = 263,                  /* t_real  */
    t_text = 264,                  /* t_text  */
    t_num = 265,                   /* t_num  */
    num = 266,                     /* num  */
    real = 267,                    /* real  */
    text = 268,                    /* text  */
    l_brackrt = 269,               /* l_brackrt  */
    r_brackrt = 270,               /* r_brackrt  */
    deuxp = 271,                   /* deuxp  */
    pvg = 272,                     /* pvg  */
    fixe = 273,                    /* fixe  */
    egal = 274,                    /* egal  */
    affecter = 275,                /* affecter  */
    si = 276,                      /* si  */
    l_parenthesis = 277,           /* l_parenthesis  */
    r_parenthesis = 278,           /* r_parenthesis  */
    alors = 279,                   /* alors  */
    sinon = 280,                   /* sinon  */
    tantque = 281,                 /* tantque  */
    faire = 282,                   /* faire  */
    add = 283,                     /* add  */
    sub = 284,                     /* sub  */
    mul = 285,                     /* mul  */
    mydev = 286,                   /* mydev  */
    et = 287,                      /* et  */
    ou = 288,                      /* ou  */
    non = 289,                     /* non  */
    inegal = 290,                  /* inegal  */
    inf = 291,                     /* inf  */
    inf_egal = 292,                /* inf_egal  */
    sup = 293,                     /* sup  */
    sup_egal = 294,                /* sup_egal  */
    affeche = 295,                 /* affeche  */
    lirre = 296,                   /* lirre  */
    idf = 297,                     /* idf  */
    faux = 298,                    /* faux  */
    vrai = 299                     /* vrai  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 58 "syntax.y"

int entier;
char* str;
float flotant;

#line 114 "syntax.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SYNTAX_TAB_H_INCLUDED  */
