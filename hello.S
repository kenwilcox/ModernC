/* enable intel asm syntax without the % prefix for registers */
.intel_syntax noprefix

/* this marks the .text section of a PE executable, which contains program code */
.text
	/* exports syscall5 to other compiation units (files) */
	.global syscall5

	syscall5:
		mov rax,rdi
		mov rdi,rsi
		mov rsi,rdx
		mov rdx,rcx
		mov r10,r8
		mov r8,r9
		syscall
		ret
