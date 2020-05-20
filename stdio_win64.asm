; syscall for Windows x64

; volatile RAX RCX RDX R8 R9 R10 R11 XMM0-5 YMM0-15(high) ZMM0-15(high)

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
	stdio_write: ; rdx:buffer r8:lenbuffer
		mov rax, rsp ; for align
		and rax, 8
		sub rsp, rax
		push rax

		sub rsp, 32 ; need to call

		mov  rcx, [rel stdio_stdout]
		mov  r9, stdio_bytesWritten
		push qword 0
		call WriteFile
		pop rax

		add rsp, 32 ; need to call

		pop rax ; for align
		and rax, 8
		add rsp, rax
		ret

	extern ReadFile
	stdio_read: ; rdx:buffer r8:lenbuffer
		mov rax, rsp ; for align
		and rax, 8
		sub rsp, rax
		push rax

		sub rsp, 32 ; need to call

		mov  rcx, [rel stdio_stdin]
		mov  r9, stdio_bytesRead
		push qword 0
		call ReadFile
		pop rax

		add rsp, 32 ; need to call

		pop rax ; for align
		and rax, 8
		add rsp, rax
		ret

	extern ExitProcess
	stdio_exit: ; rcx:exitcode
		push rax
		sub rsp, 32
		call ExitProcess
