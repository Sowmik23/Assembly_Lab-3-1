;Assignment 04
;Use of CALL and procedure
;Sree Sowmik Kumar Sarker
;Roll : 54
;This can also handle negative result in subtraction



section .data
    msg1 db 10,'Please enter your choice: ',0xa
    lmsg1 equ $ - msg1

    msg2 db '     1. Addition ',0xa
    lmsg2 equ $ - msg2

    msg3 db '     2. Subtraction ',0xa
    lmsg3 equ $ - msg3

    msg4 db '     3. Multiplication ',0xa
    lmsg4 equ $ - msg4

    msg5 db '     4. Division ',0xa
    lmsg5 equ $ - msg5

    msg6 db 'Enter two numbers : ',0xa
    lmsg6 equ $ - msg6

    msg7 db 'The result is : '
    lmsg7 equ $ - msg7

    msg8 db '     Quotient : '
    lmsg8 equ $ - msg8

    msg9 db '     Remainder : '
    lmsg9 equ $ - msg9

    newline db 0xa
    lnewline equ $ - newline

    msg10 db 'invalid option input!',0xa
    lmsg10 equ $ - msg10

    _print_minus_sign db '-'
    l_print_minus_sign equ $ -  _print_minus_sign 


section .bss
     option resb 4
     num1 resb 4
     num2 resb 4
     result resb 4
     remainder resb 4
     tmp resb 4
     chk resb 4


section .text
	global _start

_start:			;print please enter your choice
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, lmsg1
    int 0x80
 
    mov eax, 4		;1. Addition
    mov ebx, 1
    mov ecx, msg2
    mov edx, lmsg2
    int 0x80
 
    mov eax, 4		;2. Subtraction
    mov ebx, 1
    mov ecx, msg3
    mov edx, lmsg3
    int 0x80
 
    mov eax, 4		;3. Multiplication
    mov ebx, 1
    mov ecx, msg4
    mov edx, lmsg4
    int 0x80
 

    mov eax, 4		;4. Division
    mov ebx, 1
    mov ecx, msg5
    mov edx, lmsg5
    int 0x80

    				
    mov eax, 3		;taking option 
    mov ebx, 0
    mov ecx, option
    mov edx, 2
    int 0x80

    mov eax, 4		;Enter two numbers
    mov ebx, 1
    mov ecx, msg6
    mov edx, lmsg6
    int 0x80

    				
    mov eax, 3		;taking input num1
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 0x80
	
    mov eax, 3		;taking input num2
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80


_main:
    mov ah, [option]       
    sub ah, '0' 

    cmp ah, 1
    jne _check2

    call _addition
    call _call



_call:
    mov eax, 4	
    mov ebx, 1
    mov ecx, newline
    mov edx,lnewline
    int 0x80
   
_exit:
    mov eax, 1		;return program
    int 0x80


_check2:
    cmp ah, 2
    jne _check3

    call _subtraction
    call _call

_check3:
    cmp ah, 3
    jne _check4

    call _multiplication
    call _call

_check4:
    cmp ah, 4
    jne _invalid_option

    call _division
    call _call

_invalid_option:
    mov eax, 4 		;for invalid input 
    mov ebx, 1
    mov ecx, msg10
    mov edx, lmsg10
    int 0x80

    jmp _call


_addition:
    mov al, [num1]
    mov bl, [num2]

    sub al, '0'
    sub bl, '0'

    add al, bl

    add al, '0'

    mov [result], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg7
    mov edx, lmsg7
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 0x80

    ret

_subtraction:
    mov al, 0
    add al, '0'
    mov [chk],al

    mov al, [num1]
    mov bl, [num2]

    cmp al,bl
    jl _swap

 _in_operation:
    sub al, '0'
    sub bl, '0'

    sub al, bl

    add al, '0'

    mov [result], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg7
    mov edx, lmsg7
    int 0x80


    mov al, [chk]

    mov bl, 1
    add bl, '0'

    cmp al, bl
    je _print_minus

 res:
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    ret

_print_minus:
    mov eax, 4
    mov ebx, 1
    mov ecx, _print_minus_sign
    mov edx, l_print_minus_sign
    int 0x80
 
    jmp res

_swap:
    mov al, 1
    add al, '0'
    mov [chk],al

    mov al, [num1]

    mov [tmp], al
    mov al, bl
    mov bl, [tmp]

    jmp _in_operation


_multiplication:
    mov al, [num1]
    mov bl, [num2]

    sub al, '0'
    sub bl, '0'

    mul bl

    add ax, '0'

    mov [result], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg7
    mov edx, lmsg7
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    ret

_division:
	
   mov ax,0
   mov dx,0

    mov al, [num1]
    mov bl, [num2]


    sub al, '0'
    sub bl, '0'

    div bl

    add ax, '0'
    mov [result], ax

    add ah, '0'
    mov [remainder], ah

    mov eax, 4		;print the result is
    mov ebx, 1
    mov ecx, msg7
    mov edx, lmsg7
    int 0x80	

    mov eax, 4		;print newline 
    mov ebx, 1
    mov ecx, newline
    mov edx, lnewline
    int 0x80

    mov eax, 4		;Quotient:
    mov ebx, 1
    mov ecx, msg8
    mov edx, lmsg8
    int 0x80

    mov eax, 4		;print quotient
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    mov eax, 4		;print newline 
    mov ebx, 1
    mov ecx, newline
    mov edx, lnewline
    int 0x80

    mov eax, 4		;Remainder:
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 0x80
	
    mov eax, 4		;print remainder
    mov ebx, 1
    mov ecx, remainder
    mov edx, 1
    int 0x80
	
    ret


