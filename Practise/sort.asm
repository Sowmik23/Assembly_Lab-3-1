section	.text
global _start ;must be declared for using gcc

_start:	;tell linker entry point
mov ecx, [num1]
mov ebx, [num2]


cmp ecx, ebx
jl check_third_num
mov [num2],ecx
mov [num1],ebx

check_third_num:
mov ecx, [num1]
mov ebx, [num3]
cmp ecx, ebx
jl _exit
mov [num3],ecx
mov [num1],ebx


_exit:
mov ecx, [num3]
mov ebx, [num2]
cmp ebx,ecx
jl prntt

mov [num3],ebx
mov [num2],ecx

prntt:
mov ecx,msg
mov edx, len
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov ecx,num1
mov edx, 2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov ecx,msg2
mov edx, len2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov ecx,num2
mov edx, 2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov ecx,msg2
mov edx, len2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov ecx,num3
mov edx, 2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel


mov ecx,msg1
mov edx, len1
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel


mov eax, 1
int 80h

section	.data

msg db "sorted order: "
len equ $- msg 

msg2 db " "
len2 equ $ - msg2

msg1 db "",0xa
len1 equ $ - msg1

num1 dd '4'
num2 dd '15'
num3 dd '1'

segment .bss
largest resb 0
smallest resb 0
