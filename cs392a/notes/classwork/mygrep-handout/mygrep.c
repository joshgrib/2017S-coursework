#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>


#define OPTS "hcf:"
#define OPTS_HELP \
" Options:\n"\
"  -f <file>   Read data from file instead of standard input\n"\
"  -c          Only count how many lines matched.\n"\
"  -h          Print this help message\n"

/* Globals for command line options */
static int g_count_only = 0; /* Count lines only */
static char *g_search_string = NULL; /* String i'm searching for */
/* Read input from this file, instead of stdin */
static char *g_infilename = NULL;


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
static int line_matches(const char *line, const char *sstr)
{
    // find first match
    char *line_p;
    for(line_p=line; *line_p!='\0'; line_p++){
        if(*line_p == *sstr){
            printf("Checking for '%s' in '%s'", sstr, line);
            break;
            char *sstr_p;
            for(sstr_p=sstr; *sstr_p!='\0'; sstr_p++){
                printf("Checking char matches: %s to %s", *line_p, *sstr_p);
            }
        }
    }
    //check the rest of the strings for a match
    // doesn't this not catch matches after the first char found?
    //  ex: "bits" in "bacon and bits" wouldn't be found, break on "b", no match, end


    //no match, at end of line
    if(line_p=='\0'){
        return 0;
    }
    /*
    iterate over line:
        * look for sstr[0], check if the next len(sstr)-1 chars in the line are
          equal to sstr
        * if equal return true
        * if not equal continue search in line
        * if at end of line return false
    characters to look for match for search char 0
    check if rest of search string is there
    */
	return -1;
}

/* Search for string sstr in input read from in */
static int search_string(FILE *in, const char *sstr)
{
    int r = 0;
    size_t llen = 0;
    char *line = NULL;
    unsigned long sstr_matches = 0;

    while((r = getline(&line, &llen, in)) > 0){
        if(line_matches(line, sstr) != 0)
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
    if(g_count_only)
        printf("%i", g_count_only);
	return 0;
}

int main(int argc, char **argv)
{
    printf("\n");
    printf("+-----------+\n");
    printf("|  Running  |\n");
    printf("+-----------+\n");

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
