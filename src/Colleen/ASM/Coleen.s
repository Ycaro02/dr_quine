global main
extern printf

section .text

colleen:
	push rbx
	lea rdi, format
	mov rsi, 10
	mov rdx, 9
	mov rcx, 34
	lea r8, format  ; lea load effective address : https://www.developpez.net/forums/d304413/autres-langages/assembleur/8086-signification-l-instruction-lea/
	call printf
	pop rbx
	ret

main:
	push rbx
	call colleen
	pop rbx

	;	Comment

	mov rax, 0	; return 0
	ret

section .data
format:
	db ";lobal main%1$cextern printf%1$c%1$csection .text%1$ccolleen:%1$c%2$cpush rbx%1$c%2$cmov rdi, format%1$c%2$cmov rsi, 10%1$c%2$cmov rdx, 9%1$c%2$cmov rcx, 34%1$c%2$cmov r8, format%1$c%2$ccall printf%1$c%2$cpop rbx%1$c%2$cret%1$c%1$cmain:%1$c%2$cpush rbx%1$c%2$ccall colleen%1$c%2$cpop rbx%1$c%1$c%2$c;%1$c%2$c;%2$cCOMMENT2$cmov rax, 0%2$c; return 0%1$c%2$cret%1$c%1$csection .data%1$cformat:%1$c%2$cdb %3$c%4$s%3$c, 0%1$c", 0