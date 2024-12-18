%{

#include "syntax.tab.h"
#include <stdio.h>

int nbLigne = 0;

%}

%%

DEBUT           { return mc_debut; }
EXECUTION       { return mc_execution; }
"{"             { return start_block; }
"}"             { return end_block; }
FIN             { return mc_fin; }

[ \t]           { /* Ignore white space */ }
[\n]            { nbLigne++; }
"{"-.*"-}"              { /* Ignore multi-line comments */ }
"--".*?"##"             { /* Ignore single-line comments */ }
.               { printf("Erreur lexical %d: %s\n", nbLigne, yytext); }

