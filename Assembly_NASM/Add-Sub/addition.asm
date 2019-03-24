section .text
	global _start
	extern printf


_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80

	;taking num1 

	mov eax, 3
	mov ebx, 2
	mov ecx,num1
	mov edx,2
	int 0x80

	
	;taking num2

	mov eax, 3
	mov ebx, 2
	mov ecx,num2
	mov edx,2
	int 0x80
	
	
	; print the num1 & num2

	mov eax,4
	mov ebx,1
	mov ecx,num1
	mov edx,2
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,num2
	mov edx,2
	int 0x80

;add:				;addition
	mov eax, [num1]
	mov ebx, [num2]
	
	;convert ascii to decimal
	sub eax,'0'
	sub ebx,'0'
	
	add eax,ebx

	add eax,'0'

	push eax
	;push message
	;call printf
	add esp,8
	;ret


	mov [res],eax	

	;print the addition value
	mov eax,4
	mov ebx,1
	mov ecx,res
	mov edx,len_res
	int 0x80


	;return code
	mov eax,1
	mov ebx,0
	int 0x80

section .data
	msg db 'This is simple addition in assembly',0xa
	len equ $ - msg

	message db "Result = %d",10,0


section .bss
	num1: resb 2
	num2: resb 2
	res: resb 2
	len_res equ $ - res


;nasm -f elf addition.asm
;ld -m elf_i386 -s addition.o -o addition
;./addition
	
