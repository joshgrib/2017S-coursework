#ifndef OMATRIX_H
#define OMATRIX_H

typedef int matrix_elem_t;

struct omatrix {
	unsigned int d;      /* dimension */
	matrix_elem_t *data; 
};

typedef struct omatrix omatrix_t;


int omatrix_create(omatrix_t *m, unsigned int n);

int omatrix_check(omatrix_t *m);

void omatrix_destroy(omatrix_t *m);

void omatrix_transpose(omatrix_t *m, unsigned int bsize);


#endif
