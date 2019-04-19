;this code add all the element in an array
;print the array summation


section .data
	msg db 'The max element is : '
	len  equ $ - msg

	nline db 0xa
	nlen equ $ - nline

	sum db 0

	array db 1,2,1,3,2
	array_len equ $ - array

section .bss
	res resb 4


section .text
	global _start


_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, array_len	;Number of bytes to be print
	mov ecx, array 		;ecx will point to the current element to be print
	
	mov ebx, 1
	add ebx, '0'
	mov [res], ebx


_loop:
	mov ebx, [ecx]

	add ebx, '0'

	cmp ebx, [res]

	jg _swap
	
    _increment:
	inc ecx			;move pointer to the next element
	dec eax

	jnz _loop		;if counter eax not 0,then loop again
	
	

_print:
	mov eax, 4		
	mov ebx, 1
	mov ecx, res
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

_swap:
	mov [res], ebx
	jmp _increment


