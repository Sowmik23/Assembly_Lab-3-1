section .data

		newln db 0xa
		l_newln equ $ - newln

		dis db 	"Enter total Number ( 1 to 9) : "
		l_dis equ $ - dis

		enum db "Enter Digit "
		l_enum equ $ - enum

		ecol db " : "
		l_col equ $ - ecol

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

	mov ecx,dis
	mov edx,l_dis
	mov eax,4
	mov ebx,1
	int 0x80

	mov ecx,sz  ; input 
	mov edx,1
	mov eax,3
	mov ebx,0
	int 0x80

	mov ecx,dmy  ; input dummy
	mov edx,1
	mov eax,3
	mov ebx,0
	int 0x80

	mov al,[sz] 
	sub al,'0'
	mov [num],al

	mov al,0
	mov [i],al

	call _input


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
		jmp _exit


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

		cmp al,bl
		jg _swap

		mov al,[j]
		inc al
		mov [j],al

		jmp _loop2

_swap:

		mov [ecx+edx],bl
		mov dl,[j]
		mov [ecx+edx],al

		mov al,[j]
		inc al
		mov [j],al

		jmp _loop2


_exit:

		mov eax, 4
		mov ebx, 1
		mov ecx, array
		mov edx, 10
		int 0x80

		mov eax, 4		
		mov ebx, 1
		mov ecx, newln
		mov edx, l_newln
		int 0x80

_finish:

		mov eax, 1			; exit
		mov ebx, 0
		int 0x80

_input:
		cmp al,[num]
		jl _in

		ret

_in:

	mov ecx,enum
	mov edx,l_enum
	mov eax,4
	mov ebx,1
	int 0x80

	mov al,[i]
	inc al
	add al,'0'

	mov [tst],al

	mov ecx,tst
	mov edx,1
	mov eax,4
	mov ebx,1
	int 0x80

	mov ecx,ecol
	mov edx,l_col
	mov eax,4
	mov ebx,1
	int 0x80


	mov al,[i]

	add eax,array
	mov ecx,eax       ; input 
	mov edx,1
	mov eax,3
	mov ebx,0
	int 0x80

	mov ecx,dmy  ; input dummy
	mov edx,1
	mov eax,3
	mov ebx,0
	int 0x80

	mov al,[i]
	inc al
	mov [i],al

	jmp _input