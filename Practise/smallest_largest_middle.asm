section	.text
	global _start 		;must be declared for using gcc
	
	

_start:	
	mov ebx, [num1]
	mov ecx, [num2]			;tell linker entry point
	
	cmp ebx, ecx

	jl check_third_num	;jg er jaygay jl use korte hobe smallest ber korar jonno
	
	mov [num1], ecx
	mov [num2], ebx
	
	
check_third_num:
	mov ebx, [num1]
	mov ecx, [num3]
	
	cmp ebx, ecx
	
	jl check_middle	
	
	mov [num1], ecx
	mov [num3], ebx		 
	

check_middle:
	mov ebx, [num2]
	mov ecx, [num3]
	cmp ebx, ecx
	
	jl printt
	
	mov [num2], ecx
	mov [num3], ebx		 
	
printt:

	mov ecx,msg
	mov edx, len
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel

	mov ecx,num1
	mov edx, 2
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel
	
	
	mov ecx,msg1		; for printing newline after digit
	mov edx, len1
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel


mov ecx,msg2
	mov edx, len2
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel

	mov ecx,num2
	mov edx, 2
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel
	
	
	mov ecx,msg1		; for printing newline after digit
	mov edx, len1
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel


mov ecx,msg3
	mov edx, len3
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel

	mov ecx,num3
	mov edx, 2
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel
	
	
	mov ecx,msg1		; for printing newline after digit
	mov edx, len1
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel


	

	mov eax, 1			; probably that return 0/exit the program
	int 80h					



section	.data
	msg db "The smallest digit is: " 		;, 0xA,0xD
	len equ $- msg 
	
	msg1 db 0xA
	len1 equ $- msg1
	
	msg2 db "The largest digit is: " 
	len2 equ $- msg2 
	
	
	msg3 db "The middlest digit is: " 
	len3 equ $- msg3 
	
	
	
	num1 dd '14'
	num2 dd '1'
	num3 dd '3'

segment .bss
	smallest resb 0
	largest resb 0
	


