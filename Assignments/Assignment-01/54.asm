section .text

global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, lmsg2
    int 80h

    				;taking input num1
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 80h
 
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, lmsg3
    int 80h

    				;taking input num2
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 80h
 
    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, lmsg4
    int 80h
 
    mov eax, 4
    mov ebx, 1
    mov ecx, msg5
    mov edx, lmsg5
    int 80h
 
    mov eax, 4
    mov ebx, 1
    mov ecx, msg6
    mov edx, lmsg6
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg7
    mov edx, lmsg7
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg8
    mov edx, lmsg8
    int 80h

    				; Selecting choice
    mov ebx,0
    mov ecx,option
    mov edx,2
    mov eax,3
    int 80h

    mov ah, [option]       
    sub ah, '0' 

    cmp ah, 1
    je _add
    cmp ah, 2
    je _subtract
    cmp ah, 3
    je _multiply
    cmp ah, 4
    je _divide

    				; if user's input not within 1-4 
    mov eax, 4
    mov ebx, 1
    mov ecx, msg10
    mov edx, lmsg10
    int 80h

    jmp _exit

_add:
    mov al, [num1]
    mov bl, [num2]

    sub al, '0'
    sub bl, '0'

    add al, bl

    add al, '0'

    mov [result], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 80h

    jmp _exit

_subtract:
    mov al, [num1]
    mov bl, [num2]

    sub al, '0'
    sub bl, '0'

    sub al, bl

    add al, '0'

    mov [result], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h

    jmp _exit

_multiply:
    mov al, [num1]
    mov bl, [num2]

    sub al, '0'
    sub bl, '0'

    mul bl

    add ax, '0'

    mov [result], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h

    jmp _exit

_divide:
    mov al, [num1]
    mov bl, [num2]

    mov dx, 0
    mov ah, 0

    sub al, '0'
    sub bl, '0'

    div bl

    add ax, '0'
    mov [result], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h

_exit:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx,lnewline
    int 80h
   
    mov eax, 1
    int 80h


section .data
    msg2 db 10,'Enter 1st number: ',0
    lmsg2 equ $ - msg2

    msg3 db 'Enter 2nd number: ',0
    lmsg3 equ $ - msg3

    msg4 db 10,'1. Add',10,0
    lmsg4 equ $ - msg4

    msg5 db '2. Subtract',10,0
    lmsg5 equ $ - msg5

    msg6 db '3. Multiply',10,0
    lmsg6 equ $ - msg6

    msg7 db '4. Divide',10,0
    lmsg7 equ $ - msg7

    msg8 db 'Operation: ',0
    lmsg8 equ $ - msg8

    msg9 db 10,'Result: ',0
    lmsg9 equ $ - msg9

    msg10 db 10,'Please choose a number between 1-4',10,0
    lmsg10 equ $ - msg10

    newline db 10,10,0
    lnewline equ $ - newline

section .bss
    option: resb 2
    num1: resb 2
    num2: resb 2
    result: resb 2
