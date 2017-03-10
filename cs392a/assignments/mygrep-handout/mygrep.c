/*
Josh Gribbon
CS392
2017-03-09
I pledge my honor I have abided by the Stevens Honor System.
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <ctype.h> /*for tolower, warning otherwise*/


#define OPTS "hcibnf:"
#define OPTS_HELP \
" Options:\n"\
"  -f <file>   Read data from file instead of standard input\n"\
"  -c          Only count how many lines matched.\n"\
"  -i          Ignore case.\n"\
"  -h          Print this help message\n"

/* Globals for command line options */
static int g_count_only = 0; /* Count lines only */
static char *g_search_string = NULL; /* String i'm searching for */
/* Read input from this file, instead of stdin */
static char *g_infilename = NULL;
static int g_ignore_case = 0;/*Ignore case of letters*/
static int g_show_lines = 0;/*Show line number*/
static int g_show_offset = 0;/*Show match offset in line*/


/* Print usage information */
static void usage(const char *bin_name)
{
	printf("Usage: %s [OPTIONS] <search string>\n%s", bin_name, OPTS_HELP);
}

/* Parses command-line arguments and returns 0 on success or -1 on error */
static int parse_arguments(int argc, char **argv)
{
	int c;

	while ((c = getopt(argc, argv, OPTS)) != -1) {
		switch (c) {
		case 'c':
			g_count_only = 1;
			break;
        case 'i':
            g_ignore_case = 1;
            break;
        case 'n':
            g_show_lines = 1;
            break;
        case 'b':
            g_show_offset = 1;
            break;
		case 'f':
            //optarg is globally assigned when calling getopt
			g_infilename = optarg;
			break;
		case 'h':
			usage(argv[0]);
			exit(0);
		case '?':
		default:
			usage(argv[0]);
			return -1;
		}
	}

	if (optind >= argc) {
		usage(argv[0]);
		return -1;
	}

	g_search_string = argv[optind];
	return 0;
}

/* Return 0 if line matches or -1 otherwise */
static int line_matches(char *line, char *sstr, const int line_num)
{
    char *line_p;
    int offset = 0;
    //loop through all characters in the line
    for(line_p=line; *line_p!='\0'; line_p++){
        //if the char matches the first of the search string...
        if(*line_p == *sstr){
            char *sstr_p;
            char *line_p_cp = line_p;
            //see if the next characters match the rest of the search string
            for(sstr_p=sstr; *sstr_p!='\0'; sstr_p++){
                if((*line_p_cp == *sstr_p) || (g_ignore_case &&
                        (tolower(*line_p_cp) == tolower(*sstr_p)))){
                    //if we're at the end of the search strings it's a full match!
                    if(*(sstr_p+1) == '\0'){
                        if(g_show_lines){
                            //print line number
                            printf("%i ", line_num);
                        }
                        if(g_show_offset){
                            //print offset
                            printf("%i:", offset);
                        }
                        return 0;
                    }
                }else{
                    //if characters don't match then break
                    break;
                }
                line_p_cp++;
            }
        }
        offset++;
    }
    if(line_p=='\0'){
        return -1;
    }
	return -1;
}

/* Search for string sstr in input read from in */
static int search_string(FILE *in, char *sstr)
{
    int r = 0;
    size_t llen = 0;
    char *line = NULL;
    unsigned long sstr_matches = 0;

    int line_num = 0;
    while((r = getline(&line, &llen, in)) > 0){
        line_num++;
        if(line_matches(line, sstr, line_num) != 0)
            continue;
        sstr_matches++;
        if(!g_count_only){
            if(fwrite(line, 1, r, stdout) != r){
                perror("write error");
                r = -1;
                break;
            }
        }
    }
    if(line)
        free(line);
    if(r != EOF){
        perror("read error");
        return -1;
    }
    if(g_count_only){
        printf("%lu\n", sstr_matches);
    }
	return 0;
}

int main(int argc, char **argv)
{

	FILE *fin = stdin;
	int rval  = 0;

    // read in args
	if (parse_arguments(argc, argv) != 0)
		return -1;

    // open file to read if needed
	if (g_infilename) {
		if ((fin = fopen(g_infilename, "r")) == NULL) {
			perror("cannot open input file");
			return -1;
		}
	}

	rval = search_string(fin, g_search_string);

	fclose(fin);
	return rval;
}
