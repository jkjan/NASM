%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;
out_string	db "I love you, Prof.Son!", 0x0a, 0x00

	segment	.text
	global 	main
main
	enter	0,0		; setup stack frame
	pusha
	mov eax, out_string
	call	print_string
	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
