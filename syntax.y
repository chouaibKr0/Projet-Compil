%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token debut execution start_block end_block fin 

%%

S: 
    debut P_DECLARATION execution start_block P_INSTRUCTION end_block fin 
    {
        printf("Syntax correct!\n");
        YYACCEPT;
    }
    
;

P_DECLARATION:
    DECLARATION pvg P_DECLARATION | /* empty */
    ;

DECLARATION:

    ;

P_INSTRUCTION:
    INSTRUCTION pvg P_INSTRUCTION|  /* empty */
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
