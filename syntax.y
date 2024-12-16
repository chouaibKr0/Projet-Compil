%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token mc_debut mc_execution start_block end_block mc_fin

%%

S: 
    mc_debut P_DECLARATION mc_execution start_block P_INSTRUCTION end_block mc_fin 
    {
        printf("Syntax correct!\n");
        YYACCEPT;
    }
;

P_DECLARATION:
    /* empty */
    ;

P_INSTRUCTION:
    /* empty */
    ;

%%

int yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
    return 1;
}

int main(void) {
    return yyparse();
}

int yywrap() {
    return 1;
}
