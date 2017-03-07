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
	return -1;
}

/* Search for string sstr in input read from in */
static int search_string(FILE *in, const char *sstr)
{
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
