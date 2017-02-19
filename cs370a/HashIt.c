/******************************************************************************
 * Name        : HashIt.c
 * Authors     : Noel Smith, Thomas Haumersen, Joshua Gribbon
 * Version     : 1.1
 * Date        : February 12, 2017
 * Description : Solution to Spoj problem: HASHIT
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define TABLE_SIZE 101

// the set of keys
typedef struct {
	char *keys[TABLE_SIZE];
	int num_keys;
} hash_set;


//base hash function. turns string into a hash value
int hash(char *key) {
	int i;
	int sum = 0;

	for (i = 0; key[i]; i++) {
		sum += key[i] * (i + 1);
	}

	return 19 * sum % TABLE_SIZE;
}

//sets all pointers to 0 and frees strings
void clear_table(hash_set *hs) {
	hs->num_keys = 0;
	for (int i = 0; i < TABLE_SIZE; i++) {
		if (hs->keys[i] != 0) {
			free(hs->keys[i]);
			hs->keys[i] = 0;
		}
	}
}


//creates a copy of key and inserts it into hash set, if it isnt a duplicate
void insert_key(hash_set *hs, char *key) {
	int h = hash(key);
	//check for duplicate key
	for (int i = 0; i < TABLE_SIZE; i++) {
		if (hs->keys[i] != 0 && strcmp(hs->keys[i], key) == 0) {
			return;
		}
	}

	//tries inserting
	for (int i = 0; i < 20; i++) {
		int pos = (h + i * i + 23 * i) % TABLE_SIZE;
		if (hs->keys[pos] == 0) {
			hs->keys[pos] = (char *) malloc(sizeof(char) * 16);
			strcpy(hs->keys[pos], key);
			hs->num_keys++;
			break;
		}
	}
}

//removes the key from the hash set if it exists
void delete_key(hash_set *hs, char *key) {
	int h = hash(key);
	for (int i = 0; i < 20; i++) {
		int pos = (h + i * i + 23 * i) % TABLE_SIZE;
		if (hs->keys[pos] != 0 && strcmp(hs->keys[pos], key) == 0) {
			free(hs->keys[pos]);
			hs->keys[pos] = 0;
			hs->num_keys--;
			break;
		}
	}
}

//displays info about the hash set
void display_keys(hash_set *hs){
	printf("%d\n", hs->num_keys);
	for (int i = 0; i < TABLE_SIZE; i++) {
		if (hs->keys[i] != 0) {
			printf("%d:%s\n", i, hs->keys[i]);
		}
	}
}


int main() {
	int t, n;
	hash_set *hs = (hash_set *) calloc(1, sizeof(hash_set));
	scanf("%d", &t);
	while (t--) {
		clear_table(hs);
		scanf("%d", &n);
		for (int i = 0; i < n; i++) {
			char operation[4], key[17];
			scanf("%3s:%s", operation, key);
			if (!strcmp(operation, "ADD")) {
				insert_key(hs, key);
			} else {
				delete_key(hs, key);
			}
		}
		display_keys(hs);
	}
	return 0;
}
