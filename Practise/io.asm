section .data
	out_msg db 'Please enter your choice: ',0xa,'1. Addition', 0xa,'2. Subtraction',0xa,'3. Multiplication',0xa, '4. Division', 0xa
	out_len equ $-out_msg


section .bss
	in_msg resb 255
	in_len resb 1
	in_msg1 resb 255
	in_len1 resb 1
	in_msg2 resb 255
	in_len2 resb 1

	value1 resb 255
	len1 resb 1
	value2 resb 255
	len2 resb 1

section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, out_msg
	mov edx, out_len
	int 0x80

	mov eax, 3		;for taking input through console
	mov ebx, 2
	mov ecx, in_msg 	; taking decision
	mov edx, 255
	int 0x80

	mov [in_msg], ecx	;important moving a value

	mov eax, 4
	mov ebx, 1
	mov ecx, in_msg		;print the decision input value	
	mov edx, [in_len]
	int 0x80


mov eax, 4
	mov ebx, 1
	mov ecx, out_msg
	mov edx, out_len
	int 0x80


	
mov eax, 4
	mov ebx, 1
	mov ecx, in_msg		;print the decision input value	
	mov edx, [in_len]
	int 0x80


	cmp eax, ebx		;check if decision is addition
	je  _addition
	
mov eax, 4
	mov ebx, 1
	mov ecx, in_msg		;print the decision input value	
	mov edx, [in_len]
	int 0x80

	mov ebx, [in_msg]
	mov eax, 2	

	;cmp ebx, eax		;check if decision is subtraction
	;je _subtraction

	;cmp eax, 3
	;je _multiplication	;check if decision is multiplication

	;cmp eax, 4
	;je _division		;check if decision is division






_subtraction:
	mov eax, 4
	mov ebx, 1
	mov ecx, 'hello'
	mov edx, 5
	int 0x80

	

_addition:
	;take_2_input:
	mov eax, 3	;for taking input1 through console
	mov ebx, 2
	mov ecx, in_msg1
	mov edx, 255
	int 0x80
	
	;mov eax, [in_msg1]
	mov [value1],ecx
	
	mov eax, 3	;for taking input2 through console
	mov ebx, 2
	mov ecx, in_msg2
	mov edx, 255
	int 0x80

	mov [value2],ecx
	
	mov eax, [value1]
	mov ebx, [value2]	

	add eax,ebx

	mov eax, 4
	mov ebx, 1
	mov ecx, value1
	mov edx, 2
	int 0x80
	


	

;_multiplication:
	

;_division:
	



	mov eax, 1
	mov ebx, 0
	int 0x80
