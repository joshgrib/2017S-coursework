/*
Josh Gribbon - 10393762
CS392 Spring 2017
Cache Simulator Lab
I pledge my honor I have abided by the Stevens Honor System.
~Josh Gribbon
*/

#include "cachelab.h"
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <ctype.h>

//globals
static int SET_INDEX_BITS = 0;
static int LINES_PER_SET = 0;
static int BLOCK_BITS = 0;
static char *TRACEFILE = NULL;
static int VERBOSE_MODE = 0;

//struct to pass result of simulation around
struct csim_res {
    int hits;
    int misses;
    int evictions;
} cache_stats;

void recHit(){
    cache_stats.hits++;
    return;
}
void recMiss(){
    cache_stats.misses++;
    return;
}
void recEviction(){
    cache_stats.evictions++;
    return;
}

void dataLoad(char *addr){
    printf("dataLoad: %s\n", addr);
    return;
}
void dataStore(char *addr){
    printf("dataStore: %s\n", addr);
    return;
}
void dataModify(char *addr){
    printf("dataModify: %s\n", addr);
    return;
}

char* simOp(char op, char *address){
    //save current stats
    int hs = cache_stats.hits;
    int ms = cache_stats.misses;
    int es = cache_stats.evictions;

    //do operation
    switch(op){
        case 'L':
            dataLoad(address);
            break;
        case 'S':
            dataStore(address);
            break;
        case 'M':
            dataModify(address);
            break;
    }

    //find differences
    int h_diff = cache_stats.hits - hs;
    int m_diff = cache_stats.misses - ms;
    int e_diff = cache_stats.evictions - es;

    char *result = "";
    for(int i=0; i<h_diff; i++){
        strcat(result, " hit");
    }
    for(int i=0; i<m_diff; i++){
        strcat(result, " miss");
    }
    for(int i=0; i<e_diff; i++){
        strcat(result, " eviction");
    }
    return result;
}

void simCache(char *tracefile){
    /*
     *  Run cache simulation
     *  Input: file containing vilgrind trace
     *  Output: cache_sim_result struct
     */

    //initilize cache stats
    cache_stats.hits = 4;
    cache_stats.misses = 2;
    cache_stats.evictions = 0;

    //read file line by line
    FILE *file;
    file = fopen(tracefile, "r");
    char line[64];
    while(fgets(line, sizeof(line), file)){
        //skip instruction loads
        if(line[0] == 'I'){
            continue;
        }
        //get operator
        char op = line[1];
        //figure out address length
        int addr_len = 0;
        while(line[addr_len+3] != ','){
            addr_len++;
        }
        //get address
        char address[addr_len];
        for(int i=0; i<addr_len; i++){
            address[i] = line[i+3];
        }
        address[addr_len] = '\0';
        //get bytes
        int bytes = line[addr_len+4];

        //now we have the operation, address, and bytes
        //lets see what happens when we try this
        char *result = simOp(op, address);

        if(VERBOSE_MODE){
            printf("%c %s,%c %s\n", op, address, bytes, result);
        }
    }
    fclose(file);

    return;
}

int main(int argc, char **argv) {
    /*
     * Argument parsing
     * [h] - print usage message
     * [v] - set verbose mode, print trace info
     *  s  - set index bit count
     *  E  - set associativity (lines/set)
     *  b  - set block bit count
     *  t  - supply trace file
     */
    int opt = 0;
    while ((opt=getopt(argc, argv, "hvs:E:b:t:")) != -1){
        switch(opt){
            case 'h':
                printf("Usage: ./csim [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n");
                break;
            case 'v':
                VERBOSE_MODE = 1;
                break;
            case 's':
                SET_INDEX_BITS = atoi(optarg);
                break;
            case 'E':
                LINES_PER_SET = atoi(optarg);
                break;
            case 'b':
                BLOCK_BITS = atoi(optarg);
                break;
            case 't':
                TRACEFILE = optarg;
                break;
            default:
                printf("Usage: ./csim [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n");
                exit(1);
        }
    }

    //handle valid inputs with invalid values
    if(SET_INDEX_BITS < 1){
        printf("Error: Arg 's' - set index bits must be greater than 0\n");
        exit(1);
    }
    if(LINES_PER_SET < 1){
        printf("Error: Arg 'E' - associativity must be greater than 0\n");
        exit(1);
    }
    if(BLOCK_BITS < 1){
        printf("Error: Arg 'b' - block bits must be greater than 0\n");
        exit(1);
    }

    //get results from running simulation
    simCache(TRACEFILE);
    //print summary
    printSummary(cache_stats.hits, cache_stats.misses, cache_stats.evictions);
    return 0;
}
