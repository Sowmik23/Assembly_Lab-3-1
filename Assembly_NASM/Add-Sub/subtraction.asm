segment .data
	Hello: db 'Hello World',0
	message: db '%d - %d = %d',10,0

num1 dd 200d
num2 dd 1089d

segment .text
	global main
	extern printf

main:
	push rbp
	
	mov rdi, message 	;rdi = "%d - %d = %d",num1,num2,result
	
	mov rsi,[num1]		;rsi = variable num1
	mov rdx,[num2]		;rdx = variable num2

	mov rcx, [num1]		;rcx = variable num1 - variable num2
	
	sub rcx,[num2]

	call printf

	mov rax,0
	pop rbp
	ret


; nasm -f elf64 subtraction.asm 
;gcc subtraction.o -o subtraction
;./subtraction 

