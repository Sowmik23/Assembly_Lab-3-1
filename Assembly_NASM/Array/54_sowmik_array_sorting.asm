;Array Sorting
;This code first take array size as input
;then take the array element one by one
;finally print before sorting array and after sorting array elements.



section .data
	array db 1,5,3,6,4,8,4,2
	array_len equ $ - array

	nline db 0xa
	space db ' '
	msg1 db 'Before sorting array : ',0xa
	lmsg1 equ $ - msg1
	msg2 db 'After sorting array : ',0xa
	lmsg2 equ $ - msg2



section .bss
	num resb 4
	array_size resb 4

section .text 
	global _start

_start:
	mov eax, 4		;print before sorting array
	mov ebx, 1
	mov ecx, msg1
	mov edx, lmsg1
	int 0x80

	
	mov esi, 0

    _loop:
	cmp esi, array_len
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

_sort:	
	mov esi, 0
	mov ecx, array
	
    _outer_loop:
	cmp esi, array_len
	jge _print_array
	
	mov edi, 0
    _inner_loop:
	cmp edi, 5
	jge _increment


	mov eax, 0
	mov ebx, 0
	
	mov al, [ecx+edi]
	mov bl, [ecx+(edi+1)]

	cmp eax, ebx

	jle _no_xchg
	
	xchg eax, ebx

     _no_xchg:
	mov [ecx+edi], al
	mov [ecx+(edi+1)], bl

	inc edi
	jmp _inner_loop

    _increment:	
	inc esi
	jmp _outer_loop


_print_array:
	mov eax, 4		;print after sorting array
	mov ebx, 1
 	mov ecx, msg2
	mov edx, lmsg2
	int 0x80


	mov esi, 0

    _loop1:
	cmp esi, array_len 
	jge _print_newline

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
	jmp _loop1

    _print_newline:		;print new line 
	mov eax, 4
	mov ebx, 1
	mov ecx, nline	
	mov edx, 1
	int 0x80

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80


















