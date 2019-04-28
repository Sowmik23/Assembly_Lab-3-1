

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
	lmsg3 equ $ - msg4

	msg4 db 'Index : ',0xa
	lmsg4 equ $ - msg4


section .bss
	num resb 1
	i   resb 1
	j   resb 1
	sz  resb 1
	array resb 20
	dmy resb 1
	tst resb 1


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


	mov eax, 4		;print before sorted array
	mov ebx, 1
	mov ecx, array
	mov edx, 10
	int 0x80

	mov ecx,array	
	
	mov al,0
	mov [i],al

	mov al,1
	mov [j],al

	jmp _loop1


		
_loop1:
	mov al,[i]
	cmp al,[num]
	jl _loop2

	jmp _before_exit


_loop2:
	mov al,[j]
	cmp al,[num]
	jl _compare

	mov al,[i]
	inc al
	mov [i],al

	inc al
	mov [j],al

	jmp _loop1


_compare:	
	mov al,[j]
	
	mov bl,[ecx+eax]

	mov dl,[i]
	mov al,[ecx+edx]

	cmp al,bl		;check corresponding elements
	jg _swap

	mov al,[j]

	inc al
	mov [j],al

	jmp _loop2


_swap:
	mov [ecx+edx],bl	;swap if ...
	mov dl,[j]
	mov [ecx+edx],al

	mov al,[j]
	inc al
	mov [j],al

	jmp _loop2



_before_exit:
	mov eax, 4		;print after sorting
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 0x80

	mov eax, 4		;print sorted array
	mov ebx, 1
	mov ecx, array
	mov edx, 10
	int 0x80

	mov eax, 4		
	mov ebx, 1
	mov ecx, nline
	mov edx, nlen
	int 0x80


	;mov eax,3		;print 3-th array element
	;add eax,array
	;mov ecx,eax
	;mov edx,1
	;mov eax, 4
	;mov ebx, 1
	;int 0x80


_exit:
	mov eax, 1		
	mov ebx, 0
	int 0x80



_check_input:
	cmp al,[num]		;check total input number
	jl _take_input

	ret


_take_input:
	mov eax,4		;print enter element
	mov ebx,1
	mov ecx,msg1
	mov edx,lmsg1
	int 0x80

	mov al,[i]
	inc al
	add al,'0'

	mov [tst],al

	mov ecx,tst		;print take ith element 
	mov edx,1
	mov eax,4
	mov ebx,1
	int 0x80

	mov ecx,colon		;print colon
	mov edx,lcolon
	mov eax,4
	mov ebx,1
	int 0x80


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
