CC=gcc
CFLAGS=-std=c99 -Wall

getting_started.o: getting_started.c

getting_started: getting_started.o
	$(CC) $(CFLAGS) -o getting_started getting_started.o

clean:
	-rm -f getting_started.o
	-rm -f getting_started
