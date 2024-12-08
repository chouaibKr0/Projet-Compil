%{
#include <stdio.h>
#include "y.tab.h" 
    int nbLigne=1;
%}
%%
[a-zA-Z_][a-zA-Z0-9_]*  { return IDF; }

"DEBUT"                 { return DEBUT; }
"EXECUTION"             { return EXECUTION; }
"FIN"                   { return FIN; }
[ \t]                   { /* Ignore white space */ }
\n                      { nbLigne++; }
"{"                     { return STARTBLOCK; }
"}"                     { return CLOUSEBLOCK; }
"{"-.*"-}"              { /* Ignore multi-line comments */ }
"--".*?"##"             { /* Ignore single-line comments */ }
"NUM"                   { return NUM; }
"REAL"                  { return REAL; }
"TEXT"                  { return TEXT; }
[0-9]+                  { return NUMBER; }
[+\-]?([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)
                        { return REAL_NUMBER}
\"[^\"]*\"              { return STRING; }
"["                     { return L_BRACKET; }
"]"                     { return R_BRACKET; } 
":"                     {return DECLARATION; }
";"                     {return PVG; }
"FIXE"                  {return FIXE; }
"="                     {return EQL; }
"<-"                    {returnt AFF; }
"SI"                      {return SI; }
"("                      {return L_PARENTHESIS; }
")"                      {return R_PARENTHESIS; }
"ALORS"                      {return ALORS; }
"SINON"                      {return SINON; }
"TANTQUE"                      {return TANTQUE; }
"FAIRE"                      {return FAIRE; }
"+"                      {return ADD; }
"-"                      {return SUB; }
"*"                      {return MUL; }
"/"                      {return DIV; }
"ET"                      {return ET; }
"OU"                      {return OU; }
"NON"                      {return NON; }
"!="                      {return IN_EGALITE; }
"<"                      {return INF; }
"<="                      {return INF_EG; }
">"                      {return SUP; }
">="                      {return SUP_EG; }
"affiche"                      {return AFFICHE; }
"lire"                      {return LIRE; }

.               { printf("Unknown character: %s\n", yytext); }
%%
int main(){
    yylex();
    return 0;
}
