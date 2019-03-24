section .data
	out_msg db 'Please enter your choice: ',0xa,'1. Addition', 0xa,'2. Subtraction',0xa,'3. Multiplication',0xa, '4. Division', 0xa
	out_len equ $-out_msg

	nlinea        db        10,10,0
    lnlinea        equ        $ - nlinea


section .bss
	in_msg: resb 2
	value1: resb 2
	value2: resb 2
	res: resb 2
	

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

	;mov eax, 4
	;mov ebx, 1
	;mov ecx, in_msg		;print the decision input value	
	;mov edx, [in_len]
	;int 0x80

	mov ah, [in_msg]        ; Move the selected option to the registry ah
    	sub ah, '0'

	cmp ah, 1		;check if decision is addition
	je  _addition


	cmp ah, 2		;check if decision is subtraction
	je _subtraction

	cmp ah, 3
	je _multiplication	;check if decision is multiplication

	cmp ah, 4
	je _division		;check if decision is division

	jmp _exit
	

_addition:
	;take_2_input:

	mov eax, 4
	mov ebx, 1
	mov ecx, out_msg
	mov edx, out_len
	int 0x80


	mov eax, 3	;for taking input1 through console
	mov ebx, 2
	mov ecx, value1
	mov edx, 2
	int 0x80

	
	mov eax, 3	;for taking input2 through console
	mov ebx, 2
	mov ecx, value2
	mov edx, 2
	int 0x80
	
	mov al, [value1]
	mov bl, [value2]


	sub al,'0'
	sub bl,'0'

		

	add al,bl
	add al,'0'
	
	mov [res], al

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 2
	int 0x80
	
	jmp _exit


_subtraction:
	

_multiplication:
	

_division:
	



_exit:
    ; Print on screen two new lines
    mov eax, 4
    mov ebx, 1
    mov ecx, nlinea
    mov edx, lnlinea
    int 80h
    ; End the program
    mov eax, 1
    mov ebx, 0
    int 80h
