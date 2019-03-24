section .data                           
   
	nline db 0xa				;for new line
	lnline equ $ - nline  

	star db '*'
	strln equ $ - star
   
section .bss           				;Uninitialized data
	num resb 4
	i   resb 4
	j   resb 4
	r   resb 4
	


section .text          
   global _start
	
_start:  
  
	mov eax,3
	mov ebx,0
    mov ecx,num
    mov edx,1
    int 80h
	
	mov ecx,[num]
	sub ecx,'0'
	mov [num],ecx
	


	mov eax,1
	_loop1:
		mov ecx,[num]        ;ekhane 
		cmp eax,ecx
		jle _print
		jmp _exit

	_print:
	mov [i],eax
	mov eax,1
	_row:
	mov ecx,[i]
	cmp eax,ecx
	jl _printRow

	mov eax,4
	mov ebx,1
	mov ecx,star
	mov edx,strln
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,nline
	mov edx,lnline
	int 80h
	
	mov eax,[i]
	inc eax
	jmp _loop1
	
	
	_printRow:
	mov [j],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,star
	mov edx,strln
	int 80h

	mov eax,[j]
	inc eax
	jmp _row

		
	_exit:
  	mov eax, 1
    mov ebx, 0
    int 80h
