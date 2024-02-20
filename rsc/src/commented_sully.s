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
mov qword[rbp-0x8], 0x5 ; create x  = 5 at 0x4
mov qword[rbp-0x10], 0x0 ; first ptr for strdup
; mov qword[rbp-0x18], 0x0 ; second ptr for strdup


_file_access:
lea rdi, [rel file_check]
mov rsi, 0x4 ; 0x4 = R_OK
mov rax, 21 ; 21 sus_access
syscall		; call
cmp rax, 0xfffffffffffffffe ; check if return -1
je _sully_build_file_name
sub	qword[rbp-0x8], 0x1 ; decrement x
; build path fil, file_name + x
; save it for binary and add .s for souce


_sully_build_file_name:
lea rdi, [rel file_check]
call [rel strdup wrt ..got] ; call strdup with file name
mov qword[rbp-0x10], rax ; save alloc str
mov rdi, rax 	; get space addr
add rdi, 0x6	; offset, char to replace 
mov rax, qword[rbp-0x8] ; get x in rax
add rax, 48 ; ascii get char digit
mov byte[rdi], al ; update char

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
; mov r9, [rbp-0x8] ; for give x to printf
call [rel dprintf wrt ..got]

_sully_close_fd:
mov rdi, qword[rbp-0x8]
mov rax, 0x3
syscall

_sully_get_exec_name:
mov rcx, qword[rbp-0x8] ; get x
mov rdi, qword[rbp-0x10] ; get file_name
add rdi, 0x7	; offset, char to replace ('.') 
xor rax, rax ; rax = 0
mov byte[rdi], al ; update char put 0 to trunc it
mov rdi, qword[rbp-0x10] ; reset str ptr
call [rel strdup wrt ..got]
mov qword[rbp-0x18], rax ; save exec name
mov rdi, qword[rbp-0x10] ; reset str ptr
add rdi, 0x7	; offset, char to replace ('.', new 0) 
mov rax, 0x2e 	; hexa '.'
mov byte[rdi], al ; update char restor dot

; we got now binary name at 0x18 and file name at 0x10, we can simply call sprintf ?
_sully_build_cmd:
mov rdi, 200 ; ask for 512 bytes buffer
call [rel malloc wrt ..got]
mov qword[rbp-0x20], rax ; save malloc return
; RDI: buffer;
mov rdi, rax 
;RSI: constant str
lea rsi, [rel compile_cmd]
;RDX = exec
mov rdx, qword[rbp-0x18]
;RCX = source_name
mov rcx, qword[rbp-0x10]
;r8 exec
mov r8, qword[rbp-0x18]
; now we got source code we need to build command with binary and source name
call [rel sprintf wrt ..got]
; CONDITION HERE
; finaly call system 
mov rdi, qword[rbp-0x20]
call [rel system wrt ..got]
mov rdi, qword[rbp-0x20]
call [rel free wrt ..got]


_sully_free_exec_name:
mov rdi, qword[rbp-0x18]	; free ptr
call [rel free wrt ..got]

; COMMENT HERE
_sully_exit:
mov rdi, qword[rbp-0x10]	; free ptr
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
format:
db "global main%1$cextern dprintf%1$cdefault rel%1$c%1$csection .text%1$csully:%1$cpush rbp%1$cmov rbp, rsp%1$c%1$c_sully_open_file:%1$csub rsp, 0x20%1$cmov rax, 0x2%1$clea rdi, [rel file_name]%1$cmov rsi, 1101o%1$cmov rdx, 0666o%1$csyscall%1$cmov qword[rbp-0x4], eax%1$c%1$c_sully_write_child:%1$cmov edi, eax%1$clea rsi, [rel format]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel format]%1$ccall [rel dprintf wrt ..got]%1$c%1$c_sully_close_fd:%1$cmov edi, qword[rbp-0x4]%1$cmov rax, 0x3%1$csyscall%1$c; COMMENT HERE%1$c_sully_exit:%1$cmov rsp, rbp%1$cpop rbp%1$cmov eax, 0x0%1$cret%1$c", 0
file_check:
db "Sully_5.s", 0
compile_cmd:
db "nasm -f elf64 -o %s %s && gcc -Wall -Wextra -Werror -g %s", 0
; db "nasm -f elf64 -o %sO %sS && gcc -Wall -Wextra -Werror -g %sO", 0
exec_cmd:
db "./Sully_ ", 0