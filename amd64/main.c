#define AMD64
#include "syscalls.h"

typedef unsigned long int   u64;
typedef unsigned int        u32;
typedef unsigned short int  u16;
typedef unsigned char       u8;

typedef long int    i64;
typedef int	        i32;
typedef short int   i16;
typedef signed char i8;

typedef i64 intptr;
typedef u64 uintptr;

#include "../hello.c"

int main(int argc, char const* argv[]) {
	return run(argc, argv);
}
