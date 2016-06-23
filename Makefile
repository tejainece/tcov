PREFIX=arm-eabi-
CC=$(PREFIX)gcc
CFLAGS= -std=c11 -I./include -Wall

all: libtcov.so

libtcov.so: include/tcov/tcov.h src/tcov.c
	$(CC) $(CFLAGS) -c -fpic src/tcov.c -o src/tcov.o
	$(CC) -shared -o libtcov.so src/tcov.o

clean:
	-rm src/tcov.o libtcov.so
