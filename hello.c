#include "syscalls.h"

typedef unsigned long int uintptr; /* size_t */
typedef long int intptr; /* size_t */

#define internal static

void* syscall3 (
	uintptr number,
	void* arg1,
	void* arg2,
	void* arg3
);

#define stdout 1

internal
intptr write(int fd, void const* data, uintptr nbytes)
{
	return (intptr)
		syscall3(
			SYS_write,
			(void*)(intptr)fd,
			(void*)data,
			(void*)nbytes
		);
}

internal
uintptr strlen(char const* str)
{
	char const* p;
	for(p = str; *p; ++p);
	return p - str;
}

internal
uintptr puts(char const* str)
{
	return write(stdout, str, strlen(str));
}

int main(int argc, char const* argv[])
{
	puts("hello world!\n");

	return 0;
}
