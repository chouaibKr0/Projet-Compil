#ifndef SYMTAB_H
#define SYMTAB_H

#include <stdbool.h>

// Symbol table entry structure
typedef struct Symbol {
    char *name;      // Identifier name
    char *type;      // Data type (e.g., "int", "float")
    int scope_level; // Scope level
    struct Symbol *next; // Pointer for collision resolution in hash table
} Symbol;

// Symbol table structure
typedef struct SymbolTable {
    Symbol **table;  // Array of pointers to symbols (hash table buckets)
    int size;        // Number of buckets
} SymbolTable;

// Function declarations
SymbolTable *createSymbolTable(int size);
void freeSymbolTable(SymbolTable *symtab);
bool insertSymbol(SymbolTable *symtab, const char *name, const char *type, int scope_level);
Symbol *lookupSymbol(SymbolTable *symtab, const char *name);

#endif