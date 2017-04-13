#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <getopt.h>
#include "omatrix.h"

#define MAX_ITER 16

static int g_matrix_n = 0,
	   g_block = 0,
	   g_parallel = 0,
	   g_iterations = 1;


/* Print usage information */
static void usage(const char *bin_name)
{
	printf("Usage: %s [OPTIONS] <matrix dimension>\n", bin_name);
	printf("  -h          Print this message\n");
	printf("  -b <size>   Blocked transposition with block size\n"); 
	printf("  -n <number> Run number of iterations"
			" (Max: %d)\n", MAX_ITER); 
	printf("  -p          Run in parallel\n");
}

/* Print elapsed time */
static void print_time_delta(const char *msg,
		const struct timespec *t2, 
		const struct timespec *t1)
{
	struct timespec delta;

	delta.tv_sec = t2->tv_sec - t1->tv_sec;
	delta.tv_nsec = t2->tv_nsec - t1->tv_nsec;
	if (delta.tv_nsec < 0) {
		delta.tv_sec--;;
		delta.tv_nsec += 1000 * 1000 * 1000; /* 1 sec in ns */
	}

	printf("%s: \t%02lus %08ldns\n", msg, delta.tv_sec, delta.tv_nsec);
}

/* Parses command-line arguments and returns 0 on success or -1 on error */
static int parse_arguments(int argc, char **argv)
{
        int c;

        while ((c = getopt(argc, argv, "b:n:ph")) != -1) {
                switch (c) {
                case 'b':
                        g_block = atoi(optarg);
                        break;
                case 'p':
                        g_parallel = 1;
                        break;
                case 'n':
                        g_iterations = atoi(optarg);
			break;
		case 'h':
                case '?':
                        return -1;
                default:
                        abort();
                }
        }
        if (optind >= argc) {
                fprintf(stderr, "Missing argument\n");
                return -1;
        }
        g_matrix_n = atoi(argv[optind]);

	if (g_matrix_n <= 0) {
                fprintf(stderr, "Matrix dimension needs to be "
				"a positive number\n");
		return -1;
	}

	if (g_block < 0) {
                fprintf(stderr, "Block size needs to be a positive number\n");
		return -1;
	} else if (g_block > 0) {
		/* Needs to be a power of two */
		if ((g_block & (g_block - 1)) != 0) {
			fprintf(stderr, "Block size needs to "
					"be a power of 2\n");
			return -1;
		}

		/* Matrix x & y must be a multiple of the block size */
		if ((g_matrix_n % g_block) != 0) {
			fprintf(stderr, "Block needs to divide matrix "
					"dimension\n");
			return -1;
		}
	}

	if (!(g_iterations > 0 && g_iterations <= MAX_ITER)) {
		fprintf(stderr, "Number of iterations need to be between "
				"0 and %d\n", MAX_ITER);
		return -1;
	}

	if (g_iterations == 1)
		g_parallel = 0;

        return 0;
}

static int do_job(void)
{	
	int r = 0;
	omatrix_t m;
	struct timespec t1, t2;

	clock_gettime(CLOCK_MONOTONIC, &t1);
	r = omatrix_create(&m, (unsigned int)g_matrix_n);
	clock_gettime(CLOCK_MONOTONIC, &t2);
	if (r != 0) {
		perror("cannot create matrix");
		return -1;
	}
	print_time_delta("Matrix creation", &t2, &t1);

	if (g_block == 0)
		g_block = g_matrix_n;

	clock_gettime(CLOCK_MONOTONIC, &t1);
	omatrix_transpose(&m, (unsigned int)g_block);
	clock_gettime(CLOCK_MONOTONIC, &t2);
	print_time_delta("Matrix trasposition", &t2, &t1);

	r = omatrix_check(&m);

	omatrix_destroy(&m);
	if (r)  {
		printf("Transposition successful!\n");
		return 0;
	}
	printf("Transposition failed!\n");
	return -1;
}

int main(int argc, char **argv)
{
	int r = EXIT_SUCCESS;

	if (parse_arguments(argc, argv) != 0) {
		usage(argv[0]);
		return -1;
	}

	if (g_parallel) {

	} else {
		while (g_iterations-- > 0) {
			if (do_job() != 0) {
				r = EXIT_FAILURE;
				break;
			}
		}
	}

	return r;
}
