BITS 64

call START
START:
pop r9
sub r9, START

;create socket
mov rdx,6
mov rsi,1
mov rdi,2
mov rax,41
syscall

;save fd

mov r8,rax

; Create structure
xor r9,r9
push rax
push rax


mov BYTE  [rsp] , 2

mov WORD  [rsp+2], 0xd204
mov DWORD [rsp+4], 0x100007f

mov rdx , 0x10
mov rsi , rsp
mov rdi , r8
mov rax , 42
syscall


LOOP:
jmp LOOP
