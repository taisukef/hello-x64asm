%include "stdio.asm"

global _main

section .rodata
	msg db "Hello Windows x64 Assembly World!", 0x0d, 0x0a
	msg_len equ $-msg

	msg2 db "Type 8 byte and hit the enter!", 0x0d, 0x0a
	msg2_len equ $-msg2

section .bss
	buffer resb 8

section .text
	_main:
		mov rax, 123
		push rax ; to check stack

		call stdio_init

		call stdout_test
		call nestcall_test
		
		mov rdx, msg2
		mov r8, msg2_len
		call stdio_write

		mov rdx, buffer
		mov r8, 8
		call stdio_read
		mov rdx, buffer
		mov r8, 8
		call stdio_write
		
		pop rcx
		call stdio_exit ; must be 123

	nestcall_test:
		call stdout_test
		call stdout_test
		; ret

	stdout_test:
		mov  rdx, msg
		mov  r8, msg_len
		call stdio_write
		ret
