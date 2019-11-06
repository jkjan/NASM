%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;
hello	db 'hello world!', 0x00
	segment	.text
	global 	main
main
	enter	0,0		; setup stack frame
	pusha

	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;
	mov eax, hello
	call	print_string

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
