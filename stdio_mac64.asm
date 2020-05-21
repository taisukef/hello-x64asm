; syscall for macOS 64bit

section .bss
	putchar_buf resb 1
	getchar_buf resb 1

section .text
	stdio_init:
		ret

	stdio_write: ; rdx:buffer r8:lenbuffer
		push rcx
		push rdx
		push rbx
		push rax
		push rdi
		push rsi

		mov rsi, rdx; buffer
		mov rdx, r8                  ; size
		mov rdi, 1	        	; fd = stdout
		mov rax, 0x2000004		; syscall 4: write
		syscall

		pop rsi
		pop rdi
		pop rax
		pop rbx
		pop rdx
		pop rcx
		ret

	stdio_read: ; rdx:buffer r8:lenbuffer
		push rbx
		push rcx
		push rdx
		push rdi
		push rsi

		mov rdi, 0	        	; fd = stdin
		mov rsi, rdx          ; buffer
		mov rdx, r8           ; size
		mov rax, 0x2000003		; syscall 3: read
		syscall

		pop rsi
		pop rdi
		pop rdx
		pop rcx
		pop rbx
		ret

	stdio_exit: ; rcx: exitcode
		mov rdi, rcx
		mov rax, 0x2000001	; syscall 1: exit
		syscall
		ret
