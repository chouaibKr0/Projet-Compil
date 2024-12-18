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

.               { printf("Erreur lexical %d: %s\n", nbLigne, yytext); }

