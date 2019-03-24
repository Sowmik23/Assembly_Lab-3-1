
segment .data
	message: db "Result = %d + %d = %d",10,0


segment .rss
	num1 resb 2
	num2 resb 2

segment .text
	global main
	extern printf

main:

;taking num1
	mov rax,3
	mov rbx,2
	mov rcx,num1
	mov rdx,2
	

;taking num2
	mov rax,3
	mov rbx,2
	mov rcx,num2
	mov rdx,2


	push rbp
	
	mov rdi, message
	

	
	mov rsi,[num1]
	mov rdx,[num2]

	mov rcx,[num1]
	
	
	add rcx,[num2]

call printf


	mov rax,0
	pop rbp
	ret



;nasm -f elf addition.asm
;ld -m elf_i386 -s addition.o -o addition
;./addition
	
