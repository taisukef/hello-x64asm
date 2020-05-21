; syscall for Windows x64

section .data
	STDIO_QUERY_STDOUT equ -11
	STDIO_QUERY_STDIN equ -10

	stdio_stdout dq 0
	stdio_stdin dq 0
	stdio_bytesWritten dq 0
	stdio_bytesRead dq 0

section .text
	extern GetStdHandle
	stdio_init:
		mov rcx, STDIO_QUERY_STDOUT
		call GetStdHandle
		mov [rel stdio_stdout], rax

		mov rcx, STDIO_QUERY_STDIN
		call GetStdHandle
		mov [rel stdio_stdin], rax
		ret

	extern WriteFile
	stdio_write: ; rsi:buffer rdx:len of buffer
		push rax
		push rcx
		push rdx
		push r8
		push r9
		push r10
		push r11
		; omit xmm0-5, ymm0-15(high), zmm0-15(high)

		mov rax, rsp ; for align
		and rax, 8
		sub rsp, rax
		push rax

		sub rsp, 32 ; need to call

		mov r8, rdx ; len
		mov rdx, rsi ; buffer
		mov  rcx, [rel stdio_stdout]
		mov  r9, stdio_bytesWritten
		push qword 0
		call WriteFile ; volatile RAX RCX RDX R8 R9 R10 R11 XMM0-5 YMM0-15(high) ZMM0-15(high)
		pop rax

		add rsp, 32 ; need to call

		pop rax ; for align
		and rax, 8
		add rsp, rax

		pop r11
		pop r10
		pop r9
		pop r8
		pop rdx
		pop rcx
		pop rax
		ret

	extern ReadFile
	stdio_read: ; rsi:buffer rdx:len of buffer
		push rax
		push rcx
		push rdx
		push r8
		push r9
		push r10
		push r11

		mov rax, rsp ; for align
		and rax, 8
		sub rsp, rax
		push rax

		sub rsp, 32 ; need to call

		mov r8, rdx ; len
		mov rdx, rsi ; buffer
		mov  rcx, [rel stdio_stdin]
		mov  r9, stdio_bytesRead
		push qword 0
		call ReadFile
		pop rax

		add rsp, 32 ; need to call

		pop rax ; for align
		and rax, 8
		add rsp, rax

		pop r11
		pop r10
		pop r9
		pop r8
		pop rdx
		pop rcx
		pop rax
		ret

	extern ExitProcess
	stdio_exit: ; rdi: exitcode
		mov rax, rsp ; for align
		and rax, 8
		sub rsp, rax
		push rax

		mov rcx, rdi
		call ExitProcess
