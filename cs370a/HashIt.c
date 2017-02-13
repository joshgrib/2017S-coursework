/******************************************************************************
 * Name        : HashIt.c
 * Authors     : Noel Smith, Thomas Haumersen, Joshua Gribbon
 * Version     : 1.0
 * Date        : February 6, 2017
 * Description : Solution to Spoj problem: HASHIT
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

 /* PLAN
	1. Parse, seperate commands and arguments
	2. Develop methods to handle operations
	3. Connect methods and operations
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 101

/*
 * The set of keys
*/
typedef struct {
	char* keys[TABLE_SIZE];
	int num_keys;
} hash_set;

void clear_table(hash_set *set){
	for(int i = 0; i < TABLE_SIZE; i++){
		if(set->keys[i] != 0){
			free(set->keys[i]);
			set->keys[i] = 0;
		}
	}
}

int hash(char* key){
	int sum = 0;
	int n = 1;
	while(key[n-1] != '\0'){
		sum += n*((int)key[n-1]);
		n++;
	}
	return sum * 19;
}

int insert_key(hash_set *set, char *key){
	int h = hash(key);

	if(set->num_keys == TABLE_SIZE)
		return -1;

	for(int j = 0; j <= 20; j++){
		int i = (h+j*j + 23*j) % 101;

		//dont add repetitive key
		if(set->keys[i] != 0 && strcmp(set->keys[i],key) == 0){
			return -2;
		}

		if(set->keys[i] == 0){
			set->keys[i] = malloc(sizeof(char)*15);
			memcpy(set->keys[i], key, strlen(key) +1);
			set->num_keys++;
			return i;
		}
	}
	return -1;
}

int delete_key(hash_set *set, char *key){
	int h = hash(key);

	for(int j = 0; j < 20; j++){
		int i = (h+j*j + 23*j) % 101;
		if(set->keys[i] != 0 && strcmp(set->keys[i],key) == 0){
			free(set->keys[i]);
			set->keys[i] = 0;
			set->num_keys--;
			return i;
		}
	}
	return -1;
}

void display_keys(hash_set *set){
	printf("%d\n",set->num_keys);

	for(int i = 0; i < TABLE_SIZE; i++){
		if(set->keys[i] != 0){
			printf("%d:%s\n",i,set->keys[i]);
		}
	}
}

int main(void) {
	// your code here
	hash_set* hs = (hash_set*) calloc(1,sizeof(hash_set));

	clear_table(hs);

	int case_count;
	scanf("%d", &case_count);

	int op_count;
	scanf("%d", &op_count);
	for(int j = 0; j < case_count; j++){
		for(int i=0; i<op_count; i++){
			char input[19];
			scanf("%s", &input);
			if(strncmp("ADD:",input,4) == 0){
				insert_key(hs,input+4);
			}
			else{
				//del
				delete_key(hs,input+4);
			}
			//now we have the input line
		}

		display_keys(hs);
		clear_table(hs);
	}

	return 0;
}
