
section .data
	message db "Result = %d + %d = %d",10,0

	num1 dd 14
	num2 dd 46

section .text
	global _start
	extern printf


_start:
	
	
;add:				;addition

	push rbp
	
	mov rdi, message
	
	mov rsi,[num1]
	mov rdx,[num2]

	mov rcx,[num1]
	
	
	add rcx,[num2]
	add rcx,'0'

	call printf

	mov rax,0
	pop rbp
	ret



;nasm -f elf addition.asm
;ld -m elf_i386 -s addition.o -o addition
;./addition
	
