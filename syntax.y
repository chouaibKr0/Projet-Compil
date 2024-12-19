%{
    #include <stdio.h>
    #include <stdlib.h>
    int nbLigne = 1;

    typedef struct
    {
        char NomEntite[20];
        char CodeEntite[20];
    } TypeTS;


    TypeTS ts[100];

    int CpTabSym=0;
    

    int recherche(char entite[])
    {
        int i=0;
        while(i<CpTabSym){
        if (strcmp(entite,ts[i].NomEntite)==0) return i;
        i++;
        }
        return -1;
    }
    
    void inserer(char entite[], char code[])
    {

        if ( recherche(entite)==-1)
        {
            strcpy(ts[CpTabSym].NomEntite,entite);
            strcpy(ts[CpTabSym].CodeEntite,code);
            CpTabSym++;
        }
    }
    void afficher ()
    {
        printf("\n/***************Table des symboles ******************/\n");
        printf("________________________\n");
        printf("\t| NomEntite | CodeEntite \n");
        printf("________________________\n");
        int i=0;
        while(i<CpTabSym)
        {
            printf("\t|%10s |%12s |\n"

            ,ts[i].NomEntite,ts[i].CodeEntite);

            i++;
        }
    }
%}

%token debut execution start_block end_block fin t_real t_text t_num num real text l_brackrt r_brackrt deuxp pvg fixe egal affecter si l_parenthesis r_parenthesis alors sinon tantque faire add sub mul mydev et ou non inegal inf inf_egal sup sup_egal affeche lirre idf faux vrai

%union {
int entier;
char* str;
float flotant;
}

%%

Program: 
    debut P_DECLARATION execution start_block P_INSTRUCTION end_block fin 
    {
        printf("Syntax correct!\n");
        YYACCEPT;
    }
    
;


IDF2 : idf | debut | fin | execution | num | real | text |  fixe | si | alors | sinon | tantque | faire | lirre| affeche;

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
    mydev
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
    afficher ();
    return yyparse();
}

int yywrap() {
    return 1;
}
