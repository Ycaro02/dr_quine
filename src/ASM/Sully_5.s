global main
extern dprintf
extern sprintf
extern strdup
extern malloc
extern free
extern system
default rel

section .text
sully:
push rbp
mov rbp, rsp
sub rsp, 0x20 
mov qword[rbp-0x8], 0x5
mov qword[rbp-0x10], 0x0

_file_access:
lea rdi, [rel file_check]
mov rsi, 0x4
mov rax, 21
syscall
cmp rax, 0xfffffffffffffffe
je _sully_build_file_name
sub	qword[rbp-0x8], 0x1

_sully_build_file_name:
lea rdi, [rel file_check]
call [rel strdup wrt ..got]
mov qword[rbp-0x10], rax
mov rdi, rax
add rdi, 0x6 
mov rax, qword[rbp-0x8]
add rax, 48
mov byte[rdi], al

_sully_open_file:
mov rax, 0x2
mov rdi, qword[rbp-0x10]
mov rsi, 1101o
mov rdx, 0666o
syscall
mov qword[rbp-0x8], rax

_sully_write_child:
mov edi, eax
lea rsi, [rel format]
mov rdx, 10
mov rcx, 34
lea r8, [rel format]
mov r9, [rbp-0x8] ; for give x to printf
call [rel dprintf wrt ..got]

_sully_close_fd:
mov rdi, qword[rbp-0x8]
mov rax, 0x3
syscall

_sully_get_exec_name:
mov rcx, qword[rbp-0x8]
mov rdi, qword[rbp-0x10]
add rdi, 0x7 
xor rax, rax
mov byte[rdi], al
mov rdi, qword[rbp-0x10]
call [rel strdup wrt ..got]
mov qword[rbp-0x18], rax
mov rdi, qword[rbp-0x10]
add rdi, 0x7 
mov rax, 0x2e
mov byte[rdi], al

_sully_build_cmd:
mov rdi, 200
call [rel malloc wrt ..got]
mov qword[rbp-0x20], rax
mov rdi, rax 
lea rsi, [rel compile_cmd]
mov rdx, qword[rbp-0x18]
mov rcx, qword[rbp-0x10]
mov r8, qword[rbp-0x18]
mov r9, qword[rbp-0x18]
call [rel sprintf wrt ..got]
; COMMENT HERE
mov rdi, qword[rbp-0x20]
call [rel system wrt ..got]
mov rdi, qword[rbp-0x20]
call [rel free wrt ..got]


_sully_free_exec_name:
mov rdi, qword[rbp-0x18]
call [rel free wrt ..got]

_sully_exit:
mov rdi, qword[rbp-0x10]
call [rel free wrt ..got]
mov rsp, rbp
pop rbp
mov eax, 0x0
ret

main:
push rbx
call sully
pop rbx
mov rax, 0
ret

section .rodata
