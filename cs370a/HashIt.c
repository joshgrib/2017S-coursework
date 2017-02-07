/******************************************************************************
 * Name        : HashIt.java
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

#define TABLE_SIZE 101

/*
 * The set of keys
*/
typedef struct {
    char* keys[TABLE_SIZE];
    int num_keys;
} hash_set;

void clear_table(hash_set *set){
    printf("Not implemented yet");
}

int hash(char* key){
    printf("Not implemented yet");
    return 0;
}

int insert_key(hash_set *set, char *key){
    printf("Not implemented yet");
    return 0;
}

int delete_key(hash_set *set, char *key){
    printf("Not implemented yet");
    return 0;
}

void display_keys(hash_set *set){
    printf("Not implemented yet");
}

int main(void) {
	// your code here
    int case_count;
    scanf("%i", &case_count);
    int op_count;
    scanf("%i", &op_count);
    for(int i=0; i<op_count; i++){
        char input[19];
        char cmd[3] = input[]
        scanf("%s", input);
        printf("%s",input);
        //now we have the input line
    }
    printf("Done");
	return 0;
}
