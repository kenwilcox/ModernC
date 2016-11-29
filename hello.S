#include "syscalls.h"

/* enable intel asm syntax without the % prefix for registers */
.intel_syntax noprefix

/* this marks the .text section of a PE executable, which contains program code */
.text
	/* exports syscall5 to other compiation units (files) */
	.global _start, syscall
	.global syscall1, syscall2, syscall3, syscall4, syscall5

	_start:
		xor rbp,rbp /* xoring a value with itself = 0 */
		pop rdi /* rdi = argc */
		/* the pop instruction already added 8 to rsp */
		mov rsi,rsp /* rest of the stack as an array of char ptr */

		/* zero the las 4 bits of rsp, aligning it to 16 bytes
			same as "and rsp,0xfffffffffffffff0" because negative
			numbers are represented as
			max_unsigned_value + 1 - abs(negative_num) */
		and rsp,-16
		call main

		mov rdi,rax /* syscall param 1 = rax (ret value of main) */
		mov rax,SYS_exit
		syscall

		ret /* should never be reached, but if the OS somohow fails
				to kill us, it will cause a segmentation fault */

	syscall:
		mov rax,rdi
		syscall
		ret

	syscall1:
		mov rax,rdi
		mov rdi,rsi
		syscall
		ret

	syscall2:
		mov rax,rdi
		mov rdi,rsi
		mov rsi,rdx
		syscall
		ret

	syscall3:
		mov rax,rdi
		mov rdi,rsi
		mov rsi,rdx
		mov rdx,rcx
		syscall
		ret

	syscall4:
		mov rax,rdi
		mov rdi,rsi
		mov rsi,rdx
		mov rdx,rcx
		mov r10,r8
		syscall
		ret

	syscall5:
		mov rax,rdi
		mov rdi,rsi
		mov rsi,rdx
		mov rdx,rcx
		mov r10,r8
		mov r8,r9
		syscall
		ret
