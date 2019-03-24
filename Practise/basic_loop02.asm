; This is a basic loop code 
; it take input n form 1 to 10 and 
; print a string in n number


section .data
	msg db 'Enter number from 1 to 10 :',0xa
	len equ $ - msg
	
	msg1 db 'Hello I am Sree Sowmik Kumar Sarker',0xa
	len1 equ $ - msg1

	newline db ' ',0xa
	nlen equ $ - newline

section .bss	
	num resb 4
	tmp resb 4


section .text
	global _start
	

_start:
				;print msg
	mov eax, 4
	mov ebx, 1
 	mov ecx, msg
	mov edx, len
	int 0x80
				;take input
	mov eax, 3
	mov ebx, 0
 	mov ecx, num
	mov edx, 1
	int 0x80


	;mov ecx,[num]
	;sub ecx,'0'
	;mov [num],ecx

	mov eax, 4		;print the input value
	mov ebx, 1
 	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, 4		;print newline after printing input value
	mov ebx, 1
 	mov ecx, newline
	mov edx, nlen
	int 0x80	
	
	
	;mov ecx,2
	mov eax, '1'		;from where the loop start
	
for1:
	mov ecx, [num]
	cmp eax, ecx 		;check loop condition
	jg _exit
	
	mov [tmp], eax
	;push ecx

	mov eax, 4
	mov ebx, 1
 	mov ecx, msg1
	mov edx, len1
	int 0x80
	
	mov eax,[tmp]
	sub eax, '0'
	inc eax
	add eax, '0'
	;pop ecx

	
jmp for1


_exit:
	mov eax, 1		;system exit
	int 0x80

	
;compile	:nasm -f elf basic_loop02.asm
;execute	:ld -m elf_i386 basic_loop02.o -o basic_loop02
;run 		:./basic_loop02 

