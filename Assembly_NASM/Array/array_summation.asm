;this code add all the element in an array
;print the array summation


section .data
	msg db 'The array summation is : '
	len  equ $ - msg

	nline db 0xa
	nlen equ $ - nline

	sum db 0

	array db 1,2,1,1,1,2,1
	array_len equ $ - array

section .bss
	p resb 4
	q resb 4
	res resb 4


section .text
	global _start


_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, array_len		;Number of bytes to be print
	mov ebx, 0		;ebx will store the sum
	mov ecx, array 		;ecx will point to the current element to be print
	

_add:
	add ebx, [ecx]
	inc ecx			;move pointer to the next element
	dec eax

	jnz _add		;if counter eax not 0,then loop again
	
_store:
	add ebx, '0'
	mov [sum], ebx		;store result in sum
	

_print:
	mov eax, 4		
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 0x80

_newline:
	mov eax, 4		
	mov ebx, 1
	mov ecx, nline
	mov edx, nlen
	int 0x80
		

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80


