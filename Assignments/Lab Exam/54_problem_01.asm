

section .data
	nline db 0xa
	nlen equ $ - nline

	msg db 	'Enter number ',0xa
	lmsg equ $ - msg

	msg1 db 'Enter '
	lmsg1 equ $ - msg1

	msg2 db ' numbers',0xa
	lmsg2 equ $ - msg2

	msg3 db 'Enter n',0xa
	lmsg3 equ $ - msg3

	msg4 db 'Frequency : ',0xa
	lmsg4 equ $ - msg4
	

section .bss
	num resb 1
	n resb 1
	number resb 1
	i   resb 1
	j   resb 1
	size  resb 1
	array resb 20
	dmy resb 1
	fr resb 1
	p resb 1


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

	
	mov eax,4		;print Enter n
	mov ebx,1
	mov ecx,msg3
	mov edx,lmsg3
	int 0x80

	mov eax,3		;take input n
	mov ebx,0
	mov ecx,n  
	mov edx,1
	int 0x80

	mov eax,3		; input dummy
	mov ebx,0
	mov ecx,dmy  		
	mov edx,1
	int 0x80

	mov dl, [n]
	
	mov al,0		;initialize fr to 0
	mov [fr], al
	
	mov al, 0
	mov [i], al

	mov ecx, array

_loop1:
	cmp al, [num]
	jl _count_fr
	
	jmp _before_exit

   _count_fr:
	mov bl, [ecx+eax]
	cmp dl, bl
	
	je _increment_fr	

	inc al

    jmp _loop1

_increment_fr:
	mov bl, [fr]
	inc bl
	mov [fr], bl

	inc al
    jmp _loop1


_before_exit:
	mov eax, 4		;print Frequency 
	mov ebx, 1
	mov ecx, msg4
	mov edx, lmsg4
	int 0x80

	mov al, [fr]
	add al, '0'
	mov [fr], al

	mov eax, 4		;print frequency of n
	mov ebx, 1
	mov ecx, fr
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


