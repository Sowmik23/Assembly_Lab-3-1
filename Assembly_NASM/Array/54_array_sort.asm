section .data
	msg1 db 'Enter array size ( 1 to 9 ) : ',0xa
	lmsg1 equ $ - msg1

	nline db 0xa
	
	msg2 db 'Enter Digit '
	lmsg2 equ $ - msg2

	colon db ' : '
	lcolon equ $ - colon

	msg3 db 'Before sorting : ',0xa
	lmsg3 equ $ - msg3

	space db ' '
	



section .bss
	array resb 20
	array_size resb 4
	size resb 4
	num resb 4
	i resb 4
	j resb 4
	index resb 4
	dmy resb 4

section .text
	global _start


_start:
	mov eax, 4		;print Enter array size 1 to 9
	mov ebx, 1
	mov ecx, msg1
	mov edx, lmsg1
	int 0x80

	mov eax, 3		;take array_size input
	mov ebx, 0
	mov ecx, array_size
	mov edx, 1
	int 0x80

	mov eax, [array_size]
	sub eax, '0'
	mov [size], eax

	mov eax, 0
	mov [i], eax

	call _check_input


	mov eax, 4			;print before sorting array
	mov ebx, 1
	mov ecx, msg3
	mov edx, lmsg3
	int 0x80

	
	mov esi, 0

    _loop:
	cmp esi, 5
	jge _print_nline

	mov ecx, array		;pull array ith index value
	add ecx, esi
	mov eax, [ecx]
	add eax, '0'
	mov [num], eax


	mov eax, 4		;print the array element
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 0x80	
	
	mov eax, 4		;print space between array elements
	mov ebx, 1
	mov ecx, space
	mov edx, 1
	int 0x80


	inc esi
	jmp _loop

    _print_nline:		;print new line 
	mov eax, 4
	mov ebx, 1
	mov ecx, nline	
	mov edx, 1
	int 0x80








_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80






_check_input:
	cmp eax, [size]
	jl _take_input

	ret

_take_input:
	mov eax, 4		;print enter ditgit
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 0x80

	mov eax, [i]
	inc eax
	add eax, '0'

	mov [j], eax

	mov eax, 4		;print j th input 
	mov ebx, 1
	mov ecx, j
	mov edx, 1
	int 0x80


	mov eax, 4		;print colon (:) 
	mov ebx, 1
	mov ecx, colon
	mov edx, lcolon
	int 0x80

	mov eax, [i]

	add eax, array

	mov ecx, eax
	mov edx, 1		;input
	mov eax, 3
	mov ebx, 0
	int 0x80

	mov eax, 3		;input dummny
	mov ebx, 0
	mov ecx, dmy
	mov edx, 1
	int 0x80

	mov eax, [i]
	inc eax
	mov [i], eax

	jmp _check_input



