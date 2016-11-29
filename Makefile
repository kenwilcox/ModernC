#CC=gcc
CC=clang
CFLAGS=-std=c99 -Werror

all: getting-started getting-started-badly

getting-started: getting-started.o
	$(CC) $(CFLAGS) -o getting-started getting-started.o

getting-started-badly: getting-started-badly.o
	$(CC) $(CFLAGS) -o getting-started-badly getting-started-badly.o

getting-started.o: getting-started.c

getting-started-badly.o: getting-started-badly.c

clean:
	-rm -f getting-started.o getting-started
	-rm -f getting-started-badly.o getting-started-badly

