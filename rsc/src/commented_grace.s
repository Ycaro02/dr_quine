push rbp            ; push rpb save
mov rbp, rsp        ; set my own stack frame  
; idk why but i need to align stack at 0x20, with 0x8 or another i get segfault when i try to save value
; with calling dprintf
sub rsp, 0x20       
mov rax, 0x2    ; mov open syscall in rax
lea rdi, [rel file_name]    ; mov file name in rdi for syscall
mov rsi, 1101o              ; file_mode in rsi O_TRUNC, READ/WRITE, O_CREAT
mov rdx, 0666o              ; permision in rdx, 666 octal
syscall                     ; call open
mov dword[rbp-0x4], eax     ; save fd a 0x4
mov edi, eax                ; mov fd in edi for dprintf call
lea rsi, [rel file_content] ; mov str in rsi
mov rdx, 10                 ; \n in rdx (1)
mov rcx, 34                 ; " quotes in rcx (2)
lea r8, [rel file_content]  ; mov str again
call [rel dprintf wrt ..got]    ; call dprintf
mov edi, dword[rbp-0x4]     ; get fd in edi for close call
mov rax, 0x3                ; move sys close in rax
syscall                     ; call close
mov rsp, rbp                ; restore stack pointer
pop rbp                     ; pop rbp restore it
mov eax, 0x0                ; return 0
ret