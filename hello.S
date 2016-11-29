/* enable intel asm syntax without the % prefix for registers */
.intel_syntax noprefix

/* this marks the .text section of a PE executable, which contains program code */
.text
	/* exports syscall5 to other compiation units (files) */
	.global _start, syscall5

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
		mov rax,60 /* SYS_exit */
		syscall

		ret /* should never be reached, but if the OS somohow fails
				to kill us, it will cause a segmentation fault */

	syscall5:
		mov rax,rdi
		mov rdi,rsi
		mov rsi,rdx
		mov rdx,rcx
		mov r10,r8
		mov r8,r9
		syscall
		ret
