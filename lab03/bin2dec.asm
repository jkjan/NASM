%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;

	segment .bss
string	resb 	32

	segment	.text
	global 	main
main
	enter	0,0		; setup stack frame
	pusha
	
	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;
	mov 	ecx, 0
repeat: 
	call	read_char
	mov 	byte[string + ecx], al
	inc 	ecx
	cmp	al, 0x0a
	jne	repeat
	mov	byte[string + ecx - 1], 0
	dec	ecx		; the length of the string.

	mov	eax, 0
	mov	ebx, 0
	mov	ebp, 2

while:	
	sub	byte[string + ebx], '0'
	add	al, byte[string + ebx]
	mul	ebp
	inc	ebx
	cmp	ebx, ecx
	jne	while
	
	div	ebp
	call	print_int
	call	print_nl
	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
