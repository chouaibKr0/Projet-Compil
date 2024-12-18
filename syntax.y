%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token debut execution start_block end_block fin t_real t_text num real text l_brackrt r_brackrt deuxp pvg fixe egal affecter si l_parenthesis r_parenthesis alors sinon tantque faire add sub mul div et ou non inegal int inf_egal sup sup_egal affeche lire idf

%%

Program: 
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

INSTRUCTION:

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
