;This take input from 0 to 9
;print starick in triangle form 
;nested loop 

;Name : Sree Sowmik Kumar Sarker
;Roll : 54

section .data
	msg db 'Enter number from 0 to 9 :',0xa
	len equ $ - msg
	
	msg1 db '*'
	len1 equ $ - msg1

	newline db ' ',0xa
	nlen equ $ - newline

section .bss	
	num resb 4
	i resb 4
	j resb 4


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
	

	mov eax, '1'		;from where the loop start
	
for1:
	mov ecx, [num]
	cmp eax, ecx 		;check loop condition
	jg _exit
	
	mov [i], eax
	mov eax, '1'
	
	for2:
		mov ecx, [i]
		cmp eax, ecx 		;check loop condition
		jg _step

		mov [j], eax
		
		mov eax, 4
		mov ebx, 1
	 	mov ecx, msg1
		mov edx, len1
		int 0x80
		
		mov eax,[j]
		sub eax, '0'
		inc eax
		add eax, '0'
		
	jmp for2
	
	_step:	
		mov eax, 4		;print newline
		mov ebx, 1
	 	mov ecx, newline
		mov edx, nlen
		int 0x80
	
		mov eax,[i]
		sub eax, '0'
		inc eax
		add eax, '0'
	
jmp for1


_exit:
	mov eax, 1		;system exit
	int 0x80


	
;compile	:nasm -f elf 54_sowmik.asm
;execute	: ld -m elf_i386 54_sowmik.o -o 54_sowmik
;run 		:./54_sowmik 

