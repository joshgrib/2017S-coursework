#include "cachelab.h"
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>


int main(int argc, char **argv) {
    //operator parsing
    int opt = 0;
    //arguments
    int set_index_bits = 0;
    int lines_per_set = 0;
    int block_bits = 0;
    int verbose_mode = 0;
    char *tracefile = NULL;
    while ((opt=getopt(argc, argv, "hvs:E:b:t:")) != -1){
        switch(opt){
            case 'h':
                //print usage info
                printf("Usage: ./csim [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n");
                break;
            case 'v':
                //verbose, display trace info
                printf("It's gonna get might verbose up in this house!\n\n");
                verbose_mode = 1;
                break;
            case 's':
                //set index bits (2^s = number of sets, S)
                set_index_bits = atoi(optarg);
                break;
            case 'E':
                //associativity, number of lines per set
                lines_per_set = atoi(optarg);
                break;
            case 'b':
                //block bits (2^b = block size)
                block_bits = atoi(optarg);
                break;
            case 't':
                //tracefile
                tracefile = optarg;
                break;
            default:
                printf("Usage: ./csim [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n");
        }
    }
    if(set_index_bits < 1){
        printf("Error: Arg 's' - set index bits must be greater than 0\n");
        exit(1);
    }
    if(lines_per_set < 1){
        printf("Error: Arg 'E' - associativity must be greater than 0\n");
        exit(1);
    }
    if(block_bits < 1){
        printf("Error: Arg 'b' - block bits must be greater than 0\n");
        exit(1);
    }
    if(verbose_mode){
        //pass
    }

    printf("s:%i, E:%i, B:%i\n", set_index_bits, lines_per_set, block_bits);
    printf("%s\n", tracefile);



    printSummary(0, 0, 0);
    return 0;
}
