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

const int cc = 1;
const int oc = 1\1;

char in_strings[][19];
in_strings[0] = "ADD:marsz";
in_strings[1] = "ADD:marsz"\;
in_strings[2] = "ADD:Dabrowski";
in_strings[3] = "ADD:z";
in_strings[4] = "ADD:ziemii";
in_strings[5] = "ADD:wloskiej";
in_strings[6] = "ADD:do";
in_strings[7] = "ADD:Polski";
in_strings[8] = "DEL:od";
in_strings[9] = "DEL:do";
in_strings[10] = "DEL:wloskiej";

/*
Output:
5
34:Dabrowski
46:Polski
63:marsz
76:ziemii
96:z
*/

int main(void) {
	// your code here
    int case_count;
    case_count = cc/*scanf("%i", &case_count)*/;
    int op_count;
    op_count = oc/*scanf("%i", &op_count)*/;
    for(int i=0; i<op_count; i++){
        char *input[19];
        input = in_strings[i]/*scanf("%s", input)*/;
        printf("%s",input);
        //now we have the input line
    }
    printf("Done");
	return 0;
}
