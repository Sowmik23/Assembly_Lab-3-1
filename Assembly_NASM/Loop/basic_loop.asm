;Basic program that prints number from 1 to 9 

section .bss
	num resb 1


section .text
	global _start

_start:
	mov ecx,9		;from where it will end to print number
	mov eax, '1'		;from where it will start to print number

loop1:
	mov [num], eax		;print the numbers
	mov eax,4
	mov ebx, 1
	
	push ecx		;add the numbers in stack

	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, [num]
	
	sub eax, '0'
	inc eax
	add eax, '0'

	pop ecx			;without if Segmentation fault(infinite loop) occours

	loop loop1		;call loop again


	mov eax, 1		;system exit
	int 0x80



