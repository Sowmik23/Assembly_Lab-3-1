;Determine the second max in an array
; nasm -f elf problem_02.asm 
;ld -m elf_i386 problem_02.o -o problem_02
; ./problem_02 



section .data
	nline db 0xa
	nlen equ $ - nline

	msg db 	'Enter number ',0xa
	lmsg equ $ - msg

	msg1 db 'Enter '
	lmsg1 equ $ - msg1

	msg2 db ' numbers',0xa
	lmsg2 equ $ - msg2

	msg3 db 'Second Maximum : ',0xa
	lmsg3 equ $ - msg3

	msg4 db 'Max is : ',0xa
	lmsg4 equ $ - msg4

	msg5 db 'There is no second max. ',0xa
	lmsg5 equ $ - msg5


section .bss
	num resb 1
	i   resb 1
	j   resb 1
	size  resb 1
	array resb 20
	dmy resb 1
	
	max resb 1
	second_max resb 1
	index resb 1


section .text
	global _start

_start:
	mov eax,4		;print Enter number
	mov ebx,1
	mov ecx,msg
	mov edx,lmsg
	int 0x80

	mov eax,3		;take number input 
	mov ebx,0
	mov ecx,size  
	mov edx,1
	int 0x80

	mov eax,4		;print Enter 
	mov ebx,1
	mov ecx,msg1
	mov edx,lmsg1
	int 0x80

	mov eax,4		;print Enter 
	mov ebx,1
	mov ecx,size
	mov edx,1
	int 0x80

	mov eax,4		;print numbers
	mov ebx,1
	mov ecx,msg2
	mov edx,lmsg2
	int 0x80

	mov eax,3		; input dummy
	mov ebx,0
	mov ecx,dmy  		
	mov edx,1
	int 0x80

	mov al, [size] 
	sub al, '0'
	mov [num], al

	mov al,0
	mov [i],al

	call _check_input



	mov ecx,array	
	
	mov al, '*'
	mov [max], al
	mov [second_max], al

	mov al,0
	
		
_loop1:
	cmp al,[num]
	jl _check

	jmp _before_exit


_check:
	mov bl, [eax+ecx]
	mov dl, [max]	
	
	cmp bl, dl
	jg _increment1

	cmp bl, dl
	je _increment3
	
	mov dl, [second_max]

	cmp bl, dl
	jg _increment2

	inc al 
	
	jmp _loop1	

_increment1:
	mov [max], bl
	mov [second_max], dl

	inc al
    jmp _loop1

_increment2:
	mov [second_max], bl
	
	inc al
	jmp _loop1

_increment3:
	inc al 
	jmp _loop1


_before_exit:
	mov al, [second_max]

	cmp al, '*'
	je _if_no_second_max

	mov eax, 4		;print Second Maximum
	mov ebx, 1
	mov ecx, msg3
	mov edx, lmsg3
	int 0x80

	mov eax, 4		
	mov ebx, 1
	mov ecx, second_max
	mov edx, 1
	int 0x80

	mov eax, 4		
	mov ebx, 1
	mov ecx, nline
	mov edx, nlen
	int 0x80

	mov eax, 4		;print Index
	mov ebx, 1
	mov ecx, msg4
	mov edx, lmsg4
	int 0x80

	mov eax, 4		; Index
	mov ebx, 1
	mov ecx, max
	mov edx, 1
	int 0x80

	mov eax, 4		
	mov ebx, 1
	mov ecx, nline
	mov edx, nlen
	int 0x80


_exit:
	mov eax, 1		
	mov ebx, 0
	int 0x80



_check_input:
	cmp al,[num]		;check total input number
	jl _take_input

	ret


_take_input:
	mov al,[i]
	inc al
	add al,'0'

	mov al,[i]

	add eax,array
	mov ecx,eax       	;take input into array
	mov edx,1
	mov eax,3
	mov ebx,0
	int 0x80

	mov eax,3		; input dummy
	mov ebx,0
	mov ecx,dmy  	
	mov edx,1
	int 0x80

	mov al,[i]
	inc al
	mov [i],al

	jmp _check_input

_if_no_second_max:
	mov eax, 4		
	mov ebx, 1
	mov ecx, msg5
	mov edx, lmsg5
	int 0x80

	mov eax, 4		
	mov ebx, 1
	mov ecx, nline
	mov edx, nlen
	int 0x80

	jmp _exit


