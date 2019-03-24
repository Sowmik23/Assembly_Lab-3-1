section .data
	msg db "Hello, I am Omuk!",0xa
	len equ $ - msg
	

section .text
	global _start


;section .bss

_start:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80


