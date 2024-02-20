global main
extern dprintf

extern strdup
extern printf
default rel

section .text
sully:
push rbp
mov rbp, rsp
sub rsp, 0x20 
mov qword[rbp-0x8], 0x5 ; create x  = 5 at 0x4
mov qword[rbp-0x10], 0x0 ; first ptr for strdup
; mov qword[rbp-0x18], 0x0 ; second ptr for strdup


_file_access:
lea rdi, [rel _file_check]
mov rsi, 0x4 ; 0x4 = R_OK
mov rax, 21 ; 21 sus_access
syscall		; call
cmp rax, -0x1 ; check if return -1
je _sully_build_file_name
sub	qword[rbp-0x8], 0x1 ; decrement x
; build path fil, file_name + x
; save it for binary and add .s for souce


_sully_build_file_name:
cld

; mov r9, rax
; lea rdi, [rel file_name + 6]
; mov byte[rdi], al
lea rdi, [rel file_name]
call [rel strdup wrt ..got] ; call strdup with file name
mov qword[rbp-0x10], rax ; save alloc str
mov rdi, rax ; get space addr
add rdi, 0x6
mov rax, qword[rbp-0x8] ; get x in rax
add rax, 48
mov byte[rdi], al ; update char

; stosb
; mov qword[rbp-0xc], rax ; save strdup file name
; mov edx, dword[rbp-0x4] ; store x in rdx
; add edx, 48 ; digit to char

; add rax, 0x6 ; go to space to insert digit
; movzx rax, byte[edx]

_sully_open_file:
mov rax, 0x2
mov rdi, qword[rbp-0x10]
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


; now we got source code we need to build command with binary and source name

; COMMENT HERE
_sully_exit:
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
format:
db "global main%1$cextern dprintf%1$cdefault rel%1$c%1$csection .text%1$csully:%1$cpush rbp%1$cmov rbp, rsp%1$c%1$c_sully_open_file:%1$csub rsp, 0x20%1$cmov rax, 0x2%1$clea rdi, [rel file_name]%1$cmov rsi, 1101o%1$cmov rdx, 0666o%1$csyscall%1$cmov dword[rbp-0x4], eax%1$c%1$c_sully_write_child:%1$cmov edi, eax%1$clea rsi, [rel format]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel format]%1$ccall [rel dprintf wrt ..got]%1$c%1$c_sully_close_fd:%1$cmov edi, dword[rbp-0x4]%1$cmov rax, 0x3%1$csyscall%1$c; COMMENT HERE%1$c_sully_exit:%1$cmov rsp, rbp%1$cpop rbp%1$cmov eax, 0x0%1$cret%1$c", 0
file_name:
db "Sully_ ", 0
_file_check:
db "Sully_5.s", 0
file_ext:
db ".s", 0
compile_cmd:
db "nasm -f elf64 -o %sO %sS && gcc -Wall -Wextra -Werror -g %sO", 0
exec_cmd:
db "./Sully_ ", 0