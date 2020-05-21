%include "stdio.asm"

global _main

section .rodata
	MESSAGE db "Hello World!", 0x0d, 0x0a
	LEN_MESSAGE equ $-MESSAGE

section .text
	_main:
		call stdio_init

		mov rsi, MESSAGE
		mov rdx, LEN_MESSAGE
		call stdio_write

		mov rdi, 0
		call stdio_exit
		ret
