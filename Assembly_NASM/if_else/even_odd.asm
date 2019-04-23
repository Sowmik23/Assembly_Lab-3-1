;if_else
;even-odd


section .data
	msg db 'Enter a digit: ',0xa
	lmsg equ $ - msg

	nline db 0xa
	lnline equ $ - nline

	odd_msg db 'This is an odd number.',0xa
	l_odd_msg equ $ - odd_msg

	even_msg db 'This is an even number.',0xa
	l_even_msg equ $ - even_msg

section .bss
	num resb 4
	i resb 4
	remainder resb 4
	quotient resb 4


section .text
	global _start

_start:
	mov eax, 2
	mov [i], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, lmsg
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num
	mov edx, 4
	int 0x80

	mov eax, 0
	mov ebx, 0
	mov edx, 0

	mov eax, [num]
	mov ebx, [i]

	div ebx
	
	;add edx, '0'			;remainder print korte gele eita likhte hobe

	mov [remainder], edx


	;mov eax, 4			;print korle compare korte bishal jhamela kore
	;mov ebx, 1
	;mov ecx, remainder
	;mov edx, 4
	;int 0x80

	;mov eax, 4
	;mov ebx, 1
	;mov ecx, nline
	;mov edx, lnline
	;int 0x80

	mov eax, [remainder]

	cmp eax, 0
	je _print_even

_print_odd:
	mov eax, 4
	mov ebx, 1
	mov ecx, odd_msg
	mov edx, l_odd_msg
	int 0x80	

	

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80


_print_even:
	mov eax, 4
	mov ebx, 1
	mov ecx, even_msg
	mov edx, l_even_msg
	int 0x80
	
	jmp _exit



	
