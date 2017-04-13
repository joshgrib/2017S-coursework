#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <errno.h>
#include "omatrix.h"


#define MATRIX_ELEMP(m, i, j) ((m)->data + (i) * (m)->d + (j))


int omatrix_create(omatrix_t *m, unsigned int n)
{
	int i;
	matrix_elem_t *d = NULL;
	size_t msize = sizeof(matrix_elem_t) * n * n;

	/*printf ("msize=%lu, %lu\n", msize, msize/sizeof(matrix_elem_t)/n);*/

	if (msize/n/sizeof(matrix_elem_t) != n) {
		errno = ENOMEM;
		return -1;
	}

	m->data = (matrix_elem_t *)malloc(msize);
	if (!m->data)
		return -1;

	for (i = 0, d = m->data; i < (n * n); ++i)
		*(d + i) = i + 1;

	m->d = n;

	return 0;
}

void omatrix_destroy(omatrix_t *m)
{
	free(m->data);
	memset(m, 0, sizeof(omatrix_t));
}

int omatrix_check(omatrix_t *m)
{
	unsigned int i, j, e;
	matrix_elem_t *col;

	e = 1;
	for (j = 0; j < m->d; j++) {
		col = m->data + j;
		for (i = 0; i < m->d; i++, e++) {
			if (*(col + i * m->d) != e) {
				fprintf(stderr, "Matrix element (%u,%u) "
						"mismatch %d\n", i, j,
						*(col + i * m->d));
				return 0;
			}
		}
	}

	return 1;
}

/* Transpose block located on the diagonal (blockidx, blockidx) */
static void transpose_diagonal(omatrix_t *m,
		unsigned int blockidx, unsigned int b)
{
	unsigned int i, j;
	matrix_elem_t *ij, *ji, tmp;

	/* Transpose block */
	for (i = blockidx; i < (blockidx + b); i++) {
		for (j = i + 1; j < (blockidx + b); j++) {
			/* tmp = i, j */
			ij = MATRIX_ELEMP(m, i, j);
			tmp = *ij;
			/* i, j = j, i */
			ji = MATRIX_ELEMP(m, j, i);
			*ij = *ji;
			/* j, i = tmp */
			*ji = tmp;
			/* printf("(%u,%u) %d <-> %d\n", i, j, *ji, *ij); */
		}
	} /* End block traspose */
}

/* Transpose block blocki, blockj with blockj, blocki, where blocki != blockj */
static void transpose_blocks(omatrix_t *m, 
		unsigned int blocki, unsigned blockj,
		unsigned int bsize)
{
}

/* 
 * Transpose matrix. If bsize == the dimension of the matrix then blocking is
 * not used. If bsize is smaller than that, then do blocked transposition with
 * block size of bsize.
 */
void omatrix_transpose(omatrix_t *m, unsigned int bsize)
{
	unsigned int i;

	assert(m->d % bsize == 0);

	/* Diagonal blocks, bsize = m->x equivalent to non-blocking transpose */
	for (i = 0; i < m->d; i += bsize) {
		transpose_diagonal(m, i, bsize);
	}

	if (bsize >= m->d) 
		return;

	/* Non-diagonal blocks */
}
