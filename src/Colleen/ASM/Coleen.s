global main
extern printf

default rel

section .text
colleen:
push rbx
lea rdi, format
mov rsi, 10
mov rdx, 9
mov rcx, 34
lea r8, format
call [rel printf wrt ..got]
pop rbx
ret

main:
push rbx
call colleen
pop rbx
;IN_MAIN_COMMENT
mov rax, 0
ret

section .rodata
format:
db "global main%1$cextern printf%1$c%1$cdefault rel%1$c%1$csection .text%1$ccolleen:%1$cpush rbx%1$clea rdi, format%1$cmov rsi, 10%1$cmov rdx, 9%1$cmov rcx, 34%1$clea r8, format%1$ccall [rel printf wrt ..got]%1$cpop rbx%1$cret%1$c%1$cmain:%1$cpush rbx%1$ccall colleen%1$cpop rbx%1$c;IN_MAIN_COMMENT%1$cmov rax, 0%1$cret%1$c%1$csection .rodata%1$cformat:%1$cdb %3$c%4$s%3$c, 0%1$c; OUT_COMMENT%1$c", 0
; OUT_COMMENT
