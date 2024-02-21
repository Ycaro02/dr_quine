global main
extern dprintf
extern sprintf
extern strdup
extern malloc
extern free
extern system
extern strcat
default rel

; register      | type  | name  	| def           | addr  | byte
; Local var     | int   | fd     	| fd to write   | 0x4   | 4
; Local var     | int   | x     	| x count	    | 0x8   | 4
; Local var     | char* | src_name  | source name   | 0x10  | 8
; Local var     | char* | exe_name  | source name   | 0x18  | 8
; Local var     | char* | commande  | compile cmd	| 0x20  | 8
; Local var     | char* | exec_cmd  | exec cmd      | 0x28  | 8

section .text
sully:
push rbp							; save rbp
mov rbp, rsp						; set my own rbp
sub rsp, 0x40 						; alloc 0x40 byty on stack 
mov dword[rbp-0x8], 5				; create int x = 5 at 0x8
mov qword[rbp-0x10], 0x0			; create pointer at 0x10

_file_access:
lea rdi, [rel file_check]			; check for access first child file sully_5.s 
mov rsi, 0x4						; R_OK value 
mov rax, 21							; sys_access value
syscall								; call access("sully_5.s", R_OK);
cmp rax, 0xfffffffffffffffe			; compare ret and -1
je _sully_build_file_name			; if == -1, is firt, don't decrement x
sub	dword[rbp-0x8], 0x1

_sully_build_file_name:
lea rdi, [rel file_check]			; load file_check in rdi
call [rel strdup wrt ..got]			; call strdup(file_check)
mov qword[rbp-0x10], rax			; store allocated string in 0x10
mov rdi, rax						; get this string in rdi
add rdi, 0x6 						; rdi + 6 for get '5' to change
mov eax, dword[rbp-0x8]				; move x in eax
add eax, 48							; add 48 to get digit in char
mov byte[rdi], al					; put this in string

_sully_open_file:
mov rax, 0x2						; open syscall value
mov rdi, qword[rbp-0x10]			; rdi = file_src_name
mov rsi, 1101o						; rsi = 1101 in octal, O_TRUNC, O_CREAT ...
mov rdx, 0666o						; rdx = file perm 666 in octal
syscall								; call open
mov dword[rbp-0x4], eax				; store open fd in 0x4

_sully_write_child:
mov edi, eax						; move fd in rdi
lea rsi, [rel format]				; move string format in rsi
mov rdx, 10							; rdx = "\n"
mov rcx, 34							; rcx = "
lea r8, [rel format]				; r8 = format 
mov r9, [rbp-0x8] 					; r9 = x
call [rel dprintf wrt ..got]		; call dprintf

_sully_close_fd:
mov edi, dword[rbp-0x4]				; put fd in rdi
mov rax, 0x3						; put close syscall value
syscall								; call close(fd)



_sully_get_exec_name:
mov ecx, dword[rbp-0x8]				; get x in ecx
mov rdi, qword[rbp-0x10]			; get src_name in rdi
add rdi, 0x7 						; src_name + 7 to get after digit ('.')
xor rax, rax						; rax = 0
mov byte[rdi], al					; src_name[7] = '\0'
mov rdi, qword[rbp-0x10]			; get src_name in rdi
call [rel strdup wrt ..got]			; call strdup
mov qword[rbp-0x18], rax			; store res (allocated string exe name) in 0x18
mov rdi, qword[rbp-0x10]			; get src_name in rdi
add rdi, 0x7 						; add 7 again get new '\0'
mov rax, 0x2e						; restore it with '.'
mov byte[rdi], al					; restore

_sully_build_cmd:
mov rdi, 200						; alloc 512 bytes buff
call [rel malloc wrt ..got]			; call malloc
mov qword[rbp-0x20], rax			; store malloc return addr in 0x20
mov rdi, rax						; load this in rdi
lea rsi, [rel compile_cmd]			; rsi = compile cmd
mov rdx, qword[rbp-0x18]			; rdx = exe_name
mov rcx, qword[rbp-0x10]			; rcx = src_name
mov r8, qword[rbp-0x18]				; r8/r9 exe_name, cause can't use double %1$c in this printf
mov r9, qword[rbp-0x18]
call [rel sprintf wrt ..got]		; call sprint to fill 0x20 with cimpile cmd buffer fill with string
; COMMENT HERE
cmp dword[rbp-0x8], 0x0				; cmp if x == 0
je _sully_free_exit					; if equal don't exec just go free

_sully_exec_cmd:
mov rdi, 200						; alloc 512 bytes buff
call [rel malloc wrt ..got]			; malloc call
mov qword[rbp-0x28], rax			; store malloc aadr in 0x28
mov rdi, rax						; store this in rdi
lea rsi, [rel exec_cmd]				; rsi = exec_cmd
mov rdx, qword[rbp-0x18]			; rdx = src_name
call [rel sprintf wrt ..got]		; call sprintf, build exec cmd in 0x28
mov rdi, [rbp-0x20]					; get compile cmd in rdi
mov rsi, [rbp-0x28]					; get exec cmd in rsi
call [rel strcat wrt ..got]			; call strcat(build_cmd, exec_cmd)
mov rdi, qword[rbp-0x20]			; store concat string in rdi
call [rel system wrt ..got]			; call system(rdi) (new complete cmd)
mov rdi, qword[rbp-0x28]			; free 0x28
call [rel free wrt ..got]			; call free

_sully_free_exit:
mov rdi, qword[rbp-0x20]			; free 0x20
call [rel free wrt ..got]			; call free
mov rdi, qword[rbp-0x18]			; free 0x18
call [rel free wrt ..got]			; call free

_sully_exit:
mov rdi, qword[rbp-0x10]			; free 0x10
call [rel free wrt ..got]			; call free
mov rsp, rbp						; restire stack
pop rbp
mov eax, 0x0						; return 0
ret

main:
push rbx
call sully
pop rbx
mov rax, 0
ret

section .rodata
format:
db "global main%1$cextern dprintf%1$cextern sprintf%1$cextern strdup%1$cextern malloc%1$cextern free%1$cextern system%1$cextern strcat%1$cdefault rel%1$c%1$csection .text%1$csully:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 0x40 %1$cmov dword[rbp-0x8], %4$d%1$cmov qword[rbp-0x10], 0x0%1$c%1$c_file_access:%1$clea rdi, [rel file_check]%1$cmov rsi, 0x4%1$cmov rax, 21%1$csyscall%1$ccmp rax, 0xfffffffffffffffe%1$cje _sully_build_file_name%1$csub	dword[rbp-0x8], 0x1%1$c%1$c_sully_build_file_name:%1$clea rdi, [rel file_check]%1$ccall [rel strdup wrt ..got]%1$cmov qword[rbp-0x10], rax%1$cmov rdi, rax%1$cadd rdi, 0x6 %1$cmov eax, dword[rbp-0x8]%1$cadd eax, 48%1$cmov byte[rdi], al%1$c%1$c_sully_open_file:%1$cmov rax, 0x2%1$cmov rdi, qword[rbp-0x10]%1$cmov rsi, 1101o%1$cmov rdx, 0666o%1$csyscall%1$cmov dword[rbp-0x4], eax%1$c%1$c_sully_write_child:%1$cmov edi, eax%1$clea rsi, [rel format]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel format]%1$cmov r9, [rbp-0x8] ; for give x to printf%1$ccall [rel dprintf wrt ..got]%1$c%1$c_sully_close_fd:%1$cmov edi, dword[rbp-0x4]%1$cmov rax, 0x3%1$csyscall%1$c%1$c_sully_get_exec_name:%1$cmov ecx, dword[rbp-0x8]%1$cmov rdi, qword[rbp-0x10]%1$cadd rdi, 0x7 %1$cxor rax, rax%1$cmov byte[rdi], al%1$cmov rdi, qword[rbp-0x10]%1$ccall [rel strdup wrt ..got]%1$cmov qword[rbp-0x18], rax%1$cmov rdi, qword[rbp-0x10]%1$cadd rdi, 0x7 %1$cmov rax, 0x2e%1$cmov byte[rdi], al%1$c%1$c; 0x4 fd, 0x8 x count, 0x10 source name, 0x18 bin name, 0x20 cmd %1$c%1$c_sully_build_cmd:%1$cmov rdi, 200%1$ccall [rel malloc wrt ..got]%1$cmov qword[rbp-0x20], rax%1$cmov rdi, rax %1$clea rsi, [rel compile_cmd]%1$cmov rdx, qword[rbp-0x18]%1$cmov rcx, qword[rbp-0x10]%1$cmov r8, qword[rbp-0x18]%1$cmov r9, qword[rbp-0x18]%1$ccall [rel sprintf wrt ..got]%1$c; COMMENT HERE%1$ccmp dword[rbp-0x8], 0x0%1$cje _sully_free_exit%1$c%1$c_sully_exec_cmd:%1$cmov rdi, 200%1$ccall [rel malloc wrt ..got]%1$cmov qword[rbp-0x28], rax%1$cmov rdi, rax%1$clea rsi, [rel exec_cmd]%1$cmov rdx, qword[rbp-0x18]%1$ccall [rel sprintf wrt ..got]%1$cmov rdi, [rbp-0x20]%1$cmov rsi, [rbp-0x28]%1$ccall [rel strcat wrt ..got]%1$cmov rdi, qword[rbp-0x20]%1$ccall [rel system wrt ..got]%1$cmov rdi, qword[rbp-0x28]%1$ccall [rel free wrt ..got]%1$c%1$c_sully_free_exit:%1$cmov rdi, qword[rbp-0x20]%1$ccall [rel free wrt ..got]%1$cmov rdi, qword[rbp-0x18]%1$ccall [rel free wrt ..got]%1$c%1$c_sully_exit:%1$cmov rdi, qword[rbp-0x10]%1$ccall [rel free wrt ..got]%1$cmov rsp, rbp%1$cpop rbp%1$cmov eax, 0x0%1$cret%1$c%1$cmain:%1$cpush rbx%1$ccall sully%1$cpop rbx%1$cmov rax, 0%1$cret%1$c%1$csection .rodata%1$cformat:%1$cdb %2$c%3$s%2$c, 0%1$cfile_check:%1$cdb %2$cSully_5.s%2$c, 0%1$ccompile_cmd:%1$cdb %2$cnasm -f elf64 -o %%s.o %%s && gcc -g %%s.o -o %%s%2$c, 0%1$cexec_cmd:%1$cdb %2$c&& ./%%s%2$c%1$c", 0
file_check:
db "Sully_5.s", 0
compile_cmd:
db "nasm -f elf64 -o %s.o %s && gcc -g %s.o -o %s", 0
exec_cmd:
db "&& ./%s"
