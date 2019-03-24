segment .data
	num1: dq 2
	num2: dq -1
	
	div: dw 'Quotient: ',0
	message: dq '%s %lld ',10,0
	input: dq '%lld',0


	msg1 dw 'Give input1',0xa
	len1 equ $ - msg1

	msg2 dw 'Give input2',0xa
	len2 equ $ - msg2



segment .text
	global main
	extern printf
	extern scanf

main:
	push rbp

;print message
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 0x80


;take input1
	mov rax,0
	mov rsi, num1
	mov rdi, input
	
	call scanf

;print message
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 0x80


;take input2
	mov rax,0
	mov rsi,num2
	mov rdi, input
	
	call scanf

;div
	mov rax,0
	mov rbx,0
	mov rdx,0
	
	mov rax, [num1]
	mov rbx, [num2]

	div rbx

;print
	mov rdi, message
	mov rsi, div
	mov rdx, rax
	mov rax, 0
	
	call printf

	mov rax, 0
	pop rbp
	ret


;nasm -f elf64 division.asm 
;gcc division.o -o division
;./division 


