%{

#include "syntax.tab.h"
#include <stdio.h>

int nbLigne = 0;

%}

%%

DEBUT           { return debut; }
EXECUTION       { return execution; }
"{"             { return start_block; }
"}"             { return end_block; }
FIN             { return fin; }

[ \t]           { /* Ignore white space */ }
[\n]            { nbLigne++; }
"--".*?"##"             { /* Ignore single-line comments */ }
NUM                   { return t_num;}
REAL                  { return t_real; }
TEXT                  { return t_text; }
[+\-]?([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)                        { return real;}
-?[0-9]+                  { return num;
                        }
\"[^\"]*\"              { return text; }
"["                     { return l_brackrt; }
"]"                     { return r_brackrt; } 
":"                     {return deuxp; }
";"                     {return pvg; }
FIXE                  {return fixe; }
"="                     {return egal; }
"<-"                    {return affecter; }
SI                      {return si; }
"("                      {return l_parenthesis; }
")"                      {return r_parenthesis; }
ALORS                      {return alors; }
SINON                      {return sinon; }
TANTQUE                      {return tantque; }
FAIRE                      {return faire; }
"+"                      {return add; }
"-"                      {return sub; }
"*"                      {return mul; }
"/"                      {return mydev; }
ET                      {return et; }
OU                      {return ou; }
NON                      {return non; }
"!="                      {return inegal; }
"<"                      {return inf; }
"<="                      {return inf_egal; }
">"                      {return sup; }
">="                      {return sup_egal; }
affiche                      {return affeche; }
lire                      {return lirre; }
[a-zA-Z_][a-zA-Z0-9_]{0,9}        {return idf;}
.               { printf("Erreur lexical %d: %s\n", nbLigne, yytext); }

