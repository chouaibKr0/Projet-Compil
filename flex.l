%{
#include <stdio.h>
#include "y.tab.h" 
int nbLigne = 1;
%}

%%
[ \t]                  { /* Ignore white space */ }
\n                     { nbLigne++; }

\{-[^-]*-\}         { /* Ignore multi-line comments */ }
"--".*"##"             { /* Ignore single-line comments */ }

"DEBUT"                { return DEBUT; }
"EXECUTION"            { return EXECUTION; }
"FIN"                  { return FIN; }

"{"                    { return STARTBLOCK; }
"}"                    { return CLOUSEBLOCK; }
"NUM"                  { return NUM; }
"REAL"                 { return REAL; }
"TEXT"                 { return TEXT; }
"FIXE"                 { return FIXE; }
"ALORS"                { return ALORS; }
"SINON"                { return SINON; }
"TANTQUE"              { return TANTQUE; }
"FAIRE"                { return FAIRE; }
"SI"                   { return SI; }
"ET"                   { return ET; }
"OU"                   { return OU; }
"NON"                  { return NON; }
"affiche"              { return AFFICHE; }
"lire"                 { return LIRE; }

"!="                   { return IN_EGALITE; }
"<-"                   { return AFF; }
"<="                   { return INF_EG; }
">="                   { return SUP_EG; }
"<"                    { return INF; }
">"                    { return SUP; }
"="                    { return EQL; }
"["                    { return L_BRACKET; }
"]"                    { return R_BRACKET; }
":"                    { return DECLARATION; }
";"                    { return PVG; }
"("                    { return L_PARENTHESIS; }
")"                    { return R_PARENTHESIS; }
"+"                    { return ADD; }
"-"                    { return SUB; }
"*"                    { return MUL; }

[a-zA-Z_][a-zA-Z0-9_]*  { return IDF; }
[+\-]?([0-9]+\.[0-9]*|[0-9]*\.[0-9]+) { return REAL_NUMBER; }
[0-9]+                 { return NUMBER; }"/"                    { return DIV; }
\"[^\"]*\"             { return STR; }

.                      { printf("Unknown character"); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
