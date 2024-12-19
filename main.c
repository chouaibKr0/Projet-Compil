#include <stdio.h>
#include "symtab.h"
#include "syntax.tab.c"

// Global symbol table
SymbolTable *symtab;

int main() {
    // Initialize the global symbol table
    symtab = createSymbolTable(100); // Example: 100 buckets
    
    // Call the parser (which will use the lexer)
    yyparse();

    // Cleanup
    freeSymbolTable(symtab);
    return 0;
}
