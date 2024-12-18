%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token debut execution start_block end_block fin t_real t_text t_num num real text l_brackrt r_brackrt deuxp pvg fixe egal affecter si l_parenthesis r_parenthesis alors sinon tantque faire add sub mul div et ou non inegal inf inf_egal sup sup_egal affeche lire idf faux vrai

%%

Program: 
    debut P_DECLARATION execution start_block P_INSTRUCTION end_block fin 
    {
        printf("Syntax correct!\n");
        YYACCEPT;
    }
    
;


IDF2 : idf | debut |fin | ;

P_DECLARATION:
    DECLARATION pvg P_DECLARATION | /* empty */
    ;

DECLARATION:
    TYPE deuxp idf | 
    TYPE deuxp idf l_brackrt num r_brackrt|
    fixe TYPE deuxp idf egal Val
    ;
Val:
    real |
    text | 
    num
    ;
TYPE: 
    t_real | 
    t_text | 
    t_num
;

P_INSTRUCTION:
    INSTRUCTION  P_INSTRUCTION|  /* empty */
    ;

INSTRUCTION:
    AFFECTASION pvg | IF |BOUCLE |ENTREE pvg|SORTIE pvg
;


AFFECTASION:
    idf affecter EXPR
    ;

IF:
    si l_parenthesis CONDITION r_parenthesis alors start_block P_INSTRUCTION end_block sinon start_block P_INSTRUCTION end_block
    ;

CONDITION:
    EXPRL | 
    COMPARAISION
    ;
BOUCLE:
    tantque l_parenthesis CONDITION r_parenthesis faire start_block P_INSTRUCTION end_block
    ;

ENTREE:
    lirre l_parenthesis idf r_parenthesis
    ;

SORTIE:
    affeche l_parenthesis EXPR r_parenthesis
    ;

EXPR:
    idf|
    Val|
    EXPR OPA EXPR
    ;
OPA:
    add|
    sub|
    mul|
    div
    ;
EXPRL:
    faux|
    vrai|
    EXPRL OPL EXPRL
    ;
OPL:
    ou|
    et|
    non
    ;
COMPARAISION:
    Val OPC Val|
    Val OPC idf|
    idf OPC Val|
    idf OPC idf
    ;

OPC:
    inf|
    inf_egal|
    sup|
    sup_egal|
    egal|
    inegal
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
