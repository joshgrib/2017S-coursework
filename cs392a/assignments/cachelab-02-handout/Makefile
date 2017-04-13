ifeq ($(DEBUG),1)
	flags=-ggdb
else
	flags=-O2
endif
CFLAGS=$(flags) -Wall 
CC=gcc


TARGETS=trans

.PHONY: clean all

all: $(TARGETS)

trans: trans.o omatrix.o

trans.o: trans.c omatrix.h

omatrix.o: omatrix.c omatrix.h

clean:
	rm -f $(TARGETS) *.o
