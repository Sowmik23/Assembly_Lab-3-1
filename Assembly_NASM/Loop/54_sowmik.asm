; Prime Number Generator
; This code will generate all the prime numbers between 1 and 9.
; Sree Sowmik Kumar Sarker
; Roll: 54


section .data
	msg db '',0xa,'The prime numbers between 1 and 9 are:',0xa
	len equ $ - msg

	msg1 db 'Not prime',0xa
	len1 equ $ - msg1

	newline db 0xa
	newlen equ $ - newline

section .bss
	num resb 4
	i resb 4
	remainder resb 4
	quotient resb 4


section .text
	global _start

_start:
	mov eax, 4		;print msg
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	;mov ecx,8		;from where it will end to print number
	mov eax, 2		;from where it will start to print number(initaialize)


loop1:
	cmp eax, 10
	je _exit

	mov [num], eax		
		
	jmp check_prime
	
	increment_loop:
		mov eax, [num]

		;push ecx
		;sub eax, '0'
		
		inc eax			;inc dara eax er man increase kora hoyche			
					;dec use korte hoto decrease korar jonno
		;add eax, '0'
		;pop ecx		;without if Segmentation fault(infinite loop) occours
	
	jmp loop1			;call loop again
;loop loop1			

jmp _exit			;exit the program

check_prime:
	mov eax, 2
	mov [i], eax
	
	loop2:
		mov ecx, [num]
			
		cmp eax, ecx
		jnl print_prime_number		;jmp not less
		
		jmp division

	check:
		mov eax, [remainder]
		cmp eax,0

		je if_not_prime

		mov eax, [i]
		inc eax
		
		mov [i], eax

	jmp loop2

division:
	mov eax, 0
	mov edx, 0
	mov ebx, 0

	mov eax, [num]
	mov ebx, [i]

	div ebx

	mov [quotient], eax
	mov [remainder], edx

	jmp check

print_prime_number:
	mov eax, [num]
	add eax, '0'
	mov [num], eax

	mov eax,4		;print the prime number
	mov ebx, 1
	;push ecx		
	mov ecx, num
	mov edx, 4
	int 0x80

	mov eax,4		;print newline after prime number
	mov ebx, 1
	;push ecx		
	mov ecx, newline
	mov edx, newlen
	int 0x80


	mov eax, [num]
	sub eax, '0'
	mov [num], eax

	jmp increment_loop

if_not_prime:
	jmp increment_loop


_exit:
	mov eax, 1		;system exit
	int 0x80

