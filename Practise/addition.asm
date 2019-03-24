; Calculator (Addition)
; Compile with: nasm -f elf calculator-addition.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 calculator-addition.o -o calculator-addition
; Run with: ./calculator-addition
 
;%include        'functions.asm'
 


SECTION .text

SECTION .data
	value dw 0

global  _start
 
_start:
 
    mov     eax, 90     ; move our first number into eax
    mov     ebx, 9      ; move our second number into ebx
    add     eax, ebx    ; add ebx to eax
	
	mov [value], eax
	sub value,48
    
    mov eax, 4
	mov ebx, 1
	mov ecx, value
	mov edx, 2
	int 0x80


	mov eax, 1 	;ei 3 line na likhle Segmentation fault(core dumped dekhabe)
	mov ebx, 0
	int 80h
