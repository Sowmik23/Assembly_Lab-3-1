


section .data
	msg db 'Enter number from 1 to 10 :',0xa
	len equ $ - msg
	
	msg1 db 'Hello I am Sree Sowmik Kumar Sarker',0xa
	len1 equ $ - msg1

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
	mov ebx, 2
 	mov ecx, num
	mov edx, 4
	int 0x80


	mov eax,[num]
	sub eax,'0'
	add eax,'0'
	mov [num],eax

	mov eax, 4
	mov ebx, 1
 	mov ecx, num
	mov edx, 4
	int 0x80

	
	mov eax, 0		;from where the loop start
	
for1:
	cmp eax,10
	je _exit
	
	mov ecx, [num]
	push ecx
	
	mov [tmp],eax	

	mov eax, 4
	mov ebx, 1
 	mov ecx, msg1
	mov edx, len1
	int 0x80
	
	mov eax,[tmp]

	inc eax

	pop ecx

	
jmp for1


_exit:
	mov eax, 1		;system exit
	int 0x80

	
;compile	:nasm -f elf basic_loop.asm
;execute	:ld -m elf_i386 basic_loop.o -o basic_loop
;run 		:./basic_loop 

