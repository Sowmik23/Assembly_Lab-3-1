section .data
	array db 1, 4, 3, 5, 2, 6
	space db ' '
	newline db 0xA
	msgbs db "Before sorting:", 0xA
	lenmsgbs equ $-msgbs
	msgas db "After sorting:", 0xA
	lenmsgas equ $-msgas

section .bss
	num resb 4

section .text
	global _start

_start:
	; esi -> i
	; edi -> j

	mov eax, 4			; Print "Before sorting: "
	mov ebx, 1
	mov ecx, msgbs
	mov edx, lenmsgbs
	int 0x80

	mov esi, 0
	_loop1:
	cmp esi, 6
	jge _next1

	mov ecx, array
	add ecx, esi
	mov eax, [ecx]
	add eax, '0'
	mov [num], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, space
	mov edx, 1
	int 0x80

	inc esi
	jmp _loop1

	_next1:
	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	; Start sorting
	mov esi, 0
	mov ecx, array
	_outer_loop:
	cmp esi, 6
	jge _after_sort

	mov edi, 0
	_inner_loop:
	cmp edi, 5
	jge _increment

	mov eax, 0
	mov ebx, 0
	mov al, [ecx+edi]
	mov bl, [ecx+(edi+1)]
	cmp eax, ebx
	jle _skip_xchg
	xchg eax, ebx
	_skip_xchg:
	mov [ecx+edi], al
	mov [ecx+(edi+1)], bl	

	inc edi
	jmp _inner_loop

	_increment:
	inc esi
	jmp _outer_loop

	_after_sort:
	mov eax, 4			; Print "After sorting: "
	mov ebx, 1
	mov ecx, msgas
	mov edx, lenmsgas
	int 0x80

	mov esi, 0
	_loop2:
	cmp esi, 6
	jge _next2

	mov ecx, array
	add ecx, esi
	mov eax, [ecx]
	add eax, '0'
	mov [num], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, space
	mov edx, 1
	int 0x80

	inc esi
	jmp _loop2

	_next2:
	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	_exit:	
	mov eax, 1
	mov ebx, 0
	int 0x80
