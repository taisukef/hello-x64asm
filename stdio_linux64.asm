; syscall for Linux 64bit

section .bss
	putchar_buf resb 1
	getchar_buf resb 1

section .text
	stdio_init:
		ret

	stdio_write: ; rsi:buffer rdx:len of buffer
		push rax
		push rdi

		mov rdi, 1 ; fd = stdout
		mov rax, 1 ; syscall write
		syscall

		pop rdi
		pop rax
		ret

	stdio_read: ; rsi:buffer rdx:len of buffer
		push rax
		push rdi

		mov rdi, 0 ; fd = stdin
		mov rax, 0 ; syscall read
		syscall

		pop rdi
		pop rax
		ret

	stdio_exit: ; rdi: exitcode
		mov rax, 60	; syscall exit
		syscall
		ret
