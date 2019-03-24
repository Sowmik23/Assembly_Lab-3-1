section     .text
global      _start        ;must be declared for linker (ld)

_start:                   ;tell linker entry point

    mov     edx,len       ;message length
    mov     ecx,msg       ;message to write
    mov     ebx,1         ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80                                ;call kernel


mov ebx, [num1]
mov ecx, [num2]

add ebx, ecx

mov [tmp], ebx

mov     edx,2       ;message length
mov     ecx,ebx     ;message to write
mov     ebx,1         ;file descriptor (stdout)
mov     eax,4                               ;system call number (sys_write)
int     0x80 


add ebx, [num3]   

mov [result], ebx 

mov     edx,len       	;message length
    mov     ecx,msg       ;message to write
    mov     ebx,1         ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80   


mov     edx,2       ;message length
mov     ecx,result     ;message to write
mov     ebx,1         ;file descriptor (stdout)
mov     eax,4                               ;system call number (sys_write)
int     0x80 


mov     edx,lenOfnewLine       ;message length
mov     ecx,newline     ;message to write
mov     ebx,1         ;file descriptor (stdout)
mov     eax,4                               ;system call number (sys_write)
int     0x80 

    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

	msg     db  'Summation of these three digists is : '  		;our dear string
	len     equ $ - msg                             		;length of our dear string

	newline db 0xa
	lenOfnewLine equ $ - newline	
	
	num1 dd '3'
	num2 dd '7'
	num3 dd '2'
	result dd 
	tmp dd 






        ;Compile: 	nasm -f elf Hello_Wold.asm
		;Run :	  	ld -m elf_i386 -s Hello_World.o -o Hello_World
		;see output:  ./Hello_World
