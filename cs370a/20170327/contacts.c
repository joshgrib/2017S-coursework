#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ALPHABET_LENGTH 26
#define OPERATION_BUF_SIZE 5
#define NAME_BUF_SIZE 22

/* Basic trie node to direct to children and store number of nodes below this one */
typedef struct node {
    int num_children;
    struct node *children[ALPHABET_LENGTH];
} trie_node;

int main() {
    return 0;
}
