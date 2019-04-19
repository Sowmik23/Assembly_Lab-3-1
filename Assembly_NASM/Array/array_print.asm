;This code prints the array element
;this is just basic about array in nasm


section .data
	msg db 'The array : '
	len  equ $ - msg

	nline db 0xa
	nlen equ $ - nline

	array db '1','2','3','4','5','6','7','8','9'

section .bss
	cnt resb 4
	p resb 4
	res resb 4

section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 9		;Number of bytes to be print
	mov ecx, array 		;ecx will point to the current element to be print
	
_print:
	mov [cnt], eax
        mov [res], ecx

	mov eax, [res]
	add eax, '0'		;as we can add only in eax register
	mov [res], eax

	mov [p], ecx
	
	mov eax, 4		;this print the element one after one
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	;mov eax, 4		;ei newline print korate gele E theke M porjonto alphabet prit hoy...
	;mov ebx, 1
	;mov ecx, nline
	;mov edx, nlen
	;int 0x80

	mov eax, [cnt]
	mov ecx, [p]
	
	add ecx, 1	;move pointer to the next element
	dec eax 	;decrement counter
	
	jnz _print	;if counter eax is not 0, then again _print


	;mov eax, 4		;ei newline print korate gele E theke M porjonto alphabet prit hoy...	
	;mov ebx, 1
	;mov ecx, nline
	;mov edx, nlen
	;int 0x80
		

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80




