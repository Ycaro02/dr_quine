global main
extern dprintf
extern sprintf
extern strdup
extern malloc
extern free
extern system
extern strcat
default rel

section .text
sully:
push rbp
mov rbp, rsp
sub rsp, 0x40 
mov dword[rbp-0x8], 5
mov qword[rbp-0x10], 0x0

_file_access:
lea rdi, [rel file_check]
mov rsi, 0x4
mov rax, 21
syscall
cmp rax, 0xfffffffffffffffe
je _sully_build_file_name
sub	dword[rbp-0x8], 0x1

_sully_build_file_name:
cmp dword[rbp-0x8], 0x0
jl _sully_leave
lea rdi, [rel file_check]
call [rel strdup wrt ..got]
mov qword[rbp-0x10], rax
mov rdi, rax
add rdi, 0x6 
mov eax, dword[rbp-0x8]
add eax, 48
mov byte[rdi], al

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
mov r9, [rbp-0x8] ; for give x to printf
call [rel dprintf wrt ..got]

_sully_close_fd:
mov edi, dword[rbp-0x4]
mov rax, 0x3
syscall

_sully_get_exec_name:
mov ecx, dword[rbp-0x8]
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

; 0x4 fd, 0x8 x count, 0x10 source name, 0x18 bin name, 0x20 cmd 

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

_sully_exec_cmd:
mov rdi, 200
call [rel malloc wrt ..got]
mov qword[rbp-0x28], rax
mov rdi, rax
lea rsi, [rel exec_cmd]
mov rdx, qword[rbp-0x18]
mov rcx, qword[rbp-0x18]
call [rel sprintf wrt ..got]
mov rdi, [rbp-0x20]
mov rsi, [rbp-0x28]
call [rel strcat wrt ..got]
mov rdi, qword[rbp-0x20]
call [rel system wrt ..got]
mov rdi, qword[rbp-0x28]
call [rel free wrt ..got]

_sully_free_exit:
mov rdi, qword[rbp-0x20]
call [rel free wrt ..got]
mov rdi, qword[rbp-0x18]
call [rel free wrt ..got]

_sully_exit:
mov rdi, qword[rbp-0x10]
call [rel free wrt ..got]

_sully_leave:
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
db "global main%1$cextern dprintf%1$cextern sprintf%1$cextern strdup%1$cextern malloc%1$cextern free%1$cextern system%1$cextern strcat%1$cdefault rel%1$c%1$csection .text%1$csully:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 0x40 %1$cmov dword[rbp-0x8], %4$d%1$cmov qword[rbp-0x10], 0x0%1$c%1$c_file_access:%1$clea rdi, [rel file_check]%1$cmov rsi, 0x4%1$cmov rax, 21%1$csyscall%1$ccmp rax, 0xfffffffffffffffe%1$cje _sully_build_file_name%1$csub	dword[rbp-0x8], 0x1%1$c%1$c_sully_build_file_name:%1$ccmp dword[rbp-0x8], 0x0%1$cjl _sully_leave%1$clea rdi, [rel file_check]%1$ccall [rel strdup wrt ..got]%1$cmov qword[rbp-0x10], rax%1$cmov rdi, rax%1$cadd rdi, 0x6 %1$cmov eax, dword[rbp-0x8]%1$cadd eax, 48%1$cmov byte[rdi], al%1$c%1$c_sully_open_file:%1$cmov rax, 0x2%1$cmov rdi, qword[rbp-0x10]%1$cmov rsi, 1101o%1$cmov rdx, 0666o%1$csyscall%1$cmov dword[rbp-0x4], eax%1$c%1$c_sully_write_child:%1$cmov edi, eax%1$clea rsi, [rel format]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel format]%1$cmov r9, [rbp-0x8] ; for give x to printf%1$ccall [rel dprintf wrt ..got]%1$c%1$c_sully_close_fd:%1$cmov edi, dword[rbp-0x4]%1$cmov rax, 0x3%1$csyscall%1$c%1$c_sully_get_exec_name:%1$cmov ecx, dword[rbp-0x8]%1$cmov rdi, qword[rbp-0x10]%1$cadd rdi, 0x7 %1$cxor rax, rax%1$cmov byte[rdi], al%1$cmov rdi, qword[rbp-0x10]%1$ccall [rel strdup wrt ..got]%1$cmov qword[rbp-0x18], rax%1$cmov rdi, qword[rbp-0x10]%1$cadd rdi, 0x7 %1$cmov rax, 0x2e%1$cmov byte[rdi], al%1$c%1$c; 0x4 fd, 0x8 x count, 0x10 source name, 0x18 bin name, 0x20 cmd %1$c%1$c_sully_build_cmd:%1$cmov rdi, 200%1$ccall [rel malloc wrt ..got]%1$cmov qword[rbp-0x20], rax%1$cmov rdi, rax %1$clea rsi, [rel compile_cmd]%1$cmov rdx, qword[rbp-0x18]%1$cmov rcx, qword[rbp-0x10]%1$cmov r8, qword[rbp-0x18]%1$cmov r9, qword[rbp-0x18]%1$ccall [rel sprintf wrt ..got]%1$c; COMMENT HERE%1$c%1$c_sully_exec_cmd:%1$cmov rdi, 200%1$ccall [rel malloc wrt ..got]%1$cmov qword[rbp-0x28], rax%1$cmov rdi, rax%1$clea rsi, [rel exec_cmd]%1$cmov rdx, qword[rbp-0x18]%1$cmov rcx, qword[rbp-0x18]%1$ccall [rel sprintf wrt ..got]%1$cmov rdi, [rbp-0x20]%1$cmov rsi, [rbp-0x28]%1$ccall [rel strcat wrt ..got]%1$cmov rdi, qword[rbp-0x20]%1$ccall [rel system wrt ..got]%1$cmov rdi, qword[rbp-0x28]%1$ccall [rel free wrt ..got]%1$c%1$c_sully_free_exit:%1$cmov rdi, qword[rbp-0x20]%1$ccall [rel free wrt ..got]%1$cmov rdi, qword[rbp-0x18]%1$ccall [rel free wrt ..got]%1$c%1$c_sully_exit:%1$cmov rdi, qword[rbp-0x10]%1$ccall [rel free wrt ..got]%1$c%1$c_sully_leave:%1$cmov rsp, rbp%1$cpop rbp%1$cmov eax, 0x0%1$cret%1$c%1$cmain:%1$cpush rbx%1$ccall sully%1$cpop rbx%1$cmov rax, 0%1$cret%1$c%1$csection .rodata%1$cformat:%1$cdb %2$c%3$s%2$c, 0%1$cfile_check:%1$cdb %2$cSully_5.s%2$c, 0%1$ccompile_cmd:%1$cdb %2$cnasm -f elf64 -o %%s.o %%s && gcc -g %%s.o -o %%s%2$c, 0%1$cexec_cmd:%1$cdb %2$c&& rm %%s.o && ./%%s%2$c%1$c", 0
file_check:
db "Sully_5.s", 0
compile_cmd:
db "nasm -f elf64 -o %s.o %s && gcc -g %s.o -o %s", 0
exec_cmd:
db "&& rm %s.o && ./%s"
