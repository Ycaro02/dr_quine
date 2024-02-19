global main
extern printf

default rel          ; RIP-relative addressing instead of 32-bit absolute by default; makes the [rel ...] optional

section .rodata
format:
	db "global main%1$cextern printf%1$c%1$c", 0

section .text
colleen:
	push rbx
	lea rdi, format
	mov rsi, 10
	mov rdx, 9
	mov rcx, 34
	lea r8, format  ; lea load effective address : https://www.developpez.net/forums/d304413/autres-langages/assembleur/8086-signification-l-instruction-lea/
	call [rel printf wrt ..got]
	pop rbx
	ret

main:
	push rbx
	call colleen
	pop rbx

	;	Comment

	mov rax, 0	; return 0
	ret

