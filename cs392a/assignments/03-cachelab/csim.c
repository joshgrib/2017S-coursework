/*
Josh Gribbon - 10393762
CS392 Spring 2017
Cache Simulator Lab
I pledge my honor I have abided by the Stevens Honor System.
~Josh Gribbon
*/
#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <strings.h>
#include <string.h>
#include <limits.h>
#include "cachelab.h"

//input parameters
static int SET_INDEX_BITS = 0;
static int LINES_PER_SET = 0;
static int BLOCK_BITS = 0;
static char *TRACEFILE = NULL;
static int VERBOSE_MODE = 0;

//to hold 64 bit address
typedef unsigned long long int addr_t;

//cache structures
typedef struct{
    int valid;
    addr_t tag;
    int acc_num;
} cache_line_t;
typedef struct{
    cache_line_t *lines;
} cache_set_t;
typedef struct{
    cache_set_t *sets;
} cache_t;

//cache stats
static int HITS = 0;
static int MISSES = 0;
static int EVICTIONS = 0;
static int ACC_CNT = 0; //access count, for finding oldest access to evict

void printUsage(char *argv[]){
    /*
    Print out usage information for the program
    */
    printf( "Usage: %s [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n", argv[0] );
    printf(" -h:        Optional help flag that prints usage info\n");
    printf(" -v:        Optional verbose flag that displays trace info\n");
    printf(" -s <s>:    Number of set index bits (S = 2s is the number of sets)\n");
    printf(" -E <E>:    Associativity (number of lines per set)\n");
    printf(" -b <b>:    Number of block bits (B = 2b is the block size)\n");
    printf(" -t <file>: Name of the valgrind trace to replay\n");
}

void parseArgs(int argc, char **argv){
    /*
    Parse arguments and set program variables
    */
    char c;
    while( (c = getopt(argc, argv, "hvs:E:b:t:")) != -1){
        switch(c){
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
            case 'v':
                VERBOSE_MODE = 1;
                break;
            case 'h':
                printUsage(argv);
                exit( 0 );
            default:
                printUsage(argv);
                exit( 1 );
        }
    }
    return;
}

cache_t createCache(int set_index_bits, int lines_per_set){
    /*
    Set up memory for cache
    */
    cache_t cache;
    //set size = 2^s
    int SET_SIZE = ( 1 << SET_INDEX_BITS );
    //allocate memory for sets
    cache.sets = malloc(SET_SIZE * sizeof(cache_set_t));
    //allocate memory for the lines in each set
    for(int i=0; i<SET_SIZE; i++){
        cache.sets[i].lines = malloc(LINES_PER_SET * sizeof(cache_line_t));
    }
    return cache;
}

int findTag(addr_t tag, cache_set_t set){
    /*
    look for the tag in the set
    */
    for(int e = 0; e < LINES_PER_SET; e++){
        //only look in valid entries
        if(set.lines[e].valid == 1){
            //tag match = HIT!
            if(set.lines[e].tag == tag){
                HITS++;
                set.lines[e].acc_num = ACC_CNT;
                ACC_CNT++;
                return e;
            }
        }
    }
    return -1;
}

int getFreeLine(cache_set_t set){
    /*
    Find an unused line in the set
    */
    for(int e = 0; e < LINES_PER_SET; e++){
        if(set.lines[e].valid != 1){
            return e;
        }
    }
    return -1;
}

int getEvictLine(cache_set_t set){
    /*
    Find the line to evict in the set
    */
    int low = INT_MAX;
    int target = 0;
    for(int e = 0; e < LINES_PER_SET; e++){
        if(set.lines[e].valid == 1){
            if(set.lines[e].acc_num < low){
                low = set.lines[e].acc_num;
                target = e;
            }
        }
    }
    return target;
}

void accessCache(cache_t cache, addr_t address){
    /*
    Access the cache at the address
    */
    //get tag
    addr_t tag = address >> (SET_INDEX_BITS + BLOCK_BITS);
    //get set index
    int tag_size = (64 - (SET_INDEX_BITS + BLOCK_BITS));
    unsigned long long temp = address << (tag_size);
    unsigned long long setID = temp >> (tag_size + BLOCK_BITS);
    //get the set
    cache_set_t set = cache.sets[setID];

    //try to find the tag in the set
    int match_line = findTag(tag, set);

    //no HIT, let's add it
    if(match_line == -1){
        MISSES++;
        int unused_line = getFreeLine(set);
        //unused spot? put it there!
        if(unused_line > -1){
            set.lines[unused_line].valid = 1;
            set.lines[unused_line].tag = tag;
            set.lines[unused_line].acc_num = ACC_CNT;
            ACC_CNT++;
        }
        //no empty spots? time to evict!
        else if(unused_line < 0){
            int evict_line = getEvictLine(set);
            set.lines[evict_line].tag = tag;
            set.lines[evict_line].acc_num = ACC_CNT;
            ACC_CNT++;
            EVICTIONS++;
        }
    }
    return;
}

void cacheSim(cache_t cache){
    /*
    Simulate the cache using the input file
    */
    //operation, address, and size - to be read in from file
    char op;
    addr_t addr;
    int size;

    FILE *tfile = fopen(TRACEFILE, "r");

    if(tfile!=NULL){
        while(fscanf(tfile, " %c %llx,%d", &op, &addr, &size) == 3){
            if(op == 'I') continue;

            //save current stats
            int hs = HITS;
            int ms = MISSES;
            int es = EVICTIONS;

            //run operation
            switch(op){
                case 'L':
                    accessCache(cache, addr);
                    break;
                case 'S':
                    accessCache(cache, addr);
                    break;
                case 'M':
                    accessCache(cache, addr);
                    HITS++;//single access to load, guaranteed hit for saving
                    break;
            }

            //find differences
            int h_diff = HITS - hs;
            int m_diff = MISSES - ms;
            int e_diff = EVICTIONS - es;


            //if the -v flag is set print out all debug information
            if(VERBOSE_MODE == 1){
                //build access summary
                char *acc_sum = (char *) malloc(sizeof(char) * 200);
                for(int i=0; i<h_diff; i++){
                    strcat(acc_sum, "hit ");
                }
                for(int i=0; i<m_diff; i++){
                    strcat(acc_sum, "miss ");
                }
                for(int i=0; i<e_diff; i++){
                    strcat(acc_sum, "eviction ");
                }
                printf( "%c %llx,%d %s\n", op, addr, size, acc_sum);
            }
        }
    }
    return;
}

int main(int argc, char **argv) {
    //parse arguments and set variables
    parseArgs(argc, argv);
    //allocate memory and create cache
    cache_t cache = createCache(SET_INDEX_BITS, LINES_PER_SET);
    //use the cache to simulate the trace
    cacheSim(cache);
    //print out values
    printSummary(HITS, MISSES, EVICTIONS);
    return 0;
}
