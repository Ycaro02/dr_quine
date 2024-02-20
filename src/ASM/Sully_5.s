global main
extern dprintf
default rel

section .text
sully:
push rbp
mov rbp, rsp

_sully_open_file:
sub rsp, 0x20
mov rax, 0x2
lea rdi, [rel file_name]
mov rsi, 1101o
mov rdx, 0666o
syscall
mov dword[rbp-0x4], eax

_sully_write_child:
mov edi, eax
lea rsi, [rel format]
mov rdx, 10
mov rcx, 34
lea r8, [rel format]
call [rel dprintf wrt ..got]

_sully_close_fd:
mov edi, dword[rbp-0x4]
mov rax, 0x3
syscall
; COMMENT HERE
_sully_exit:
mov rsp, rbp
pop rbp
mov eax, 0x0
ret
