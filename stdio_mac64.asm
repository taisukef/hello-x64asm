; syscall for macOS 64bit

section .bss
	putchar_buf resb 1
	getchar_buf resb 1

section .text
	stdio_init:
		ret

	stdio_write: ; rsi:buffer rdx:len of buffer
		push rax
		push rdi

		mov rdi, 1	        	; fd = stdout
		mov rax, 0x2000004		; syscall 4: write
		syscall

		pop rdi
		pop rax
		ret

	stdio_read: ; rsi:buffer rdx:len of buffer
		push rax
		push rdi

		mov rdi, 0	        	; fd = stdin
		mov rax, 0x2000003		; syscall 3: read
		syscall

		pop rdi
		pop rax
		ret

	stdio_exit: ; rdi: exitcode
		mov rax, 0x2000001	; syscall 1: exit
		syscall
		ret
