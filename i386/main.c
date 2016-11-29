#define I386
#include "syscalls.h"

typedef unsigned long long int  u64;
typedef unsigned int            u32;
typedef unsigned short int      u16;
typedef unsigned char           u8;

typedef long long int   i64;
typedef int             i32;
typedef short int       i16;
typedef signed char     i8;

typedef i32 intptr;
typedef u32 uintptr;

#include "../hello.c"

int main(int argc, char const* argv[]) {
    return run(argc, argv);
}