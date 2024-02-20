%define GRACE "%%define GRACE %2$c%3$s%2$c, 0%1$c%%define NO_MAIN global main%1$c%%define START_MACRO main:%1$csection .text%1$cextern dprintf%1$cdefault rel%1$cNO_MAIN%1$cSTART_MACRO%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 0x20%1$cmov rax, 0x2%1$clea rdi, [rel file_name]%1$cmov rsi, 1101o%1$cmov rdx, 0666o%1$csyscall%1$cmov dword[rbp-0x4], eax%1$cmov edi, eax%1$clea rsi, [rel file_content]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel file_content]%1$ccall [rel dprintf wrt ..got]%1$cmov edi, dword[rbp-0x4]%1$cmov rax, 0x3%1$csyscall%1$cmov rsp, rbp%1$cpop rbp%1$cmov eax, 0x0%1$cret%1$c; COMMENTE HERE%1$csection .data%1$cfile_name:%1$cdb %2$cGrace_kid.s%2$c, 0%1$cfile_content:%1$cdb GRACE, 0%1$c", 0
%define NO_MAIN global main
%define START_MACRO main:
section .text
extern dprintf
default rel
NO_MAIN
START_MACRO
push rbp
mov rbp, rsp
sub rsp, 0x20
mov rax, 0x2
lea rdi, [rel file_name]
mov rsi, 1101o
mov rdx, 0666o
syscall
mov dword[rbp-0x4], eax
mov edi, eax
lea rsi, [rel file_content]
mov rdx, 10
mov rcx, 34
lea r8, [rel file_content]
call [rel dprintf wrt ..got]
mov edi, dword[rbp-0x4]
mov rax, 0x3
syscall
mov rsp, rbp
pop rbp
mov eax, 0x0
ret
; COMMENTE HERE
section .data
file_name:
db "Grace_kid.s", 0
file_content:
db GRACE, 0
