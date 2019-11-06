%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;

	segment .bss
string	resb 32

	segment	.text
	global 	main
main
	enter	0,0		; setup stack frame
	pusha
	
	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;
	mov 	edx, 0
repeat: call	read_char
	mov 	byte[string + edx], al
	inc 	edx
	cmp	al, 0x0a
	jne	repeat
	mov	byte[string + edx - 1], 0
	mov	eax,	string
	call	print_string
	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
