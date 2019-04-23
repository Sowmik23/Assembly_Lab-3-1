

section .data
	nline db 0xa
	nlen equ $ - nline

	msg db 	'Enter array size ( 1 to 9) : ',0xa
	lmsg equ $ - msg

	msg1 db 'Enter element '
	lmsg1 equ $ - msg1

	msg2 db 0xa,'After Sorting : '
	lmsg2 equ $ - msg2

	msg3 db 'Before Sorting : '
	lmsg3 equ $ - msg3

	colon db " : "
	lcolon equ $ - colon

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
	mov eax,4		;print enter arrray size
	mov ebx,1
	mov ecx,msg
	mov edx,lmsg
	int 0x80

	mov eax,3		;take array size input 
	mov ebx,0
	mov ecx,sz  
	mov edx,1
	int 0x80

	mov eax,3		; input dummy
	mov ebx,0
	mov ecx,dmy  		
	mov edx,1
	int 0x80

	mov al,[sz] 
	sub al,'0'
	mov [num],al

	mov al,0
	mov [i],al

	call _input

	mov eax,4		;print msg before sorting
	mov ebx,1
	mov ecx,msg3
	mov edx,lmsg3
	int 0x80
	

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
	mov eax, 4		
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



_input:
	cmp al,[num]		;check total input number
	jl _in

	ret


_in:
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
	mov ecx,eax       	; input into array
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

	jmp _input
