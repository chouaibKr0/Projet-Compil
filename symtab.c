#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab.h"

static unsigned int hash(const char *str, int size) {
    unsigned int hash = 0;
    while (*str) hash = (hash << 5) + *str++;
    return hash % size;
}

SymbolTable *createSymbolTable(int size) {
    SymbolTable *symtab = malloc(sizeof(SymbolTable));
    symtab->table = calloc(size, sizeof(Symbol *));
    symtab->size = size;
    return symtab;
}

void freeSymbolTable(SymbolTable *symtab) {
    for (int i = 0; i < symtab->size; ++i) {
        Symbol *entry = symtab->table[i];
        while (entry) {
            Symbol *temp = entry;
            entry = entry->next;
            free(temp->name);
            free(temp->type);
            free(temp);
        }
    }
    free(symtab->table);
    free(symtab);
}

bool insertSymbol(SymbolTable *symtab, const char *name, const char *type, int scope_level) {
    unsigned int index = hash(name, symtab->size);
    Symbol *entry = symtab->table[index];
    while (entry) {
        if (strcmp(entry->name, name) == 0) return false; // Already exists
        entry = entry->next;
    }
    Symbol *new_symbol = malloc(sizeof(Symbol));
    new_symbol->name = strdup(name);
    new_symbol->type = strdup(type);
    new_symbol->scope_level = scope_level;
    new_symbol->next = symtab->table[index];
    symtab->table[index] = new_symbol;
    return true;
}

Symbol *lookupSymbol(SymbolTable *symtab, const char *name) {
    unsigned int index = hash(name, symtab->size);
    Symbol *entry = symtab->table[index];
    while (entry) {
        if (strcmp(entry->name, name) == 0) return entry;
        entry = entry->next;
    }
    return NULL;
}
