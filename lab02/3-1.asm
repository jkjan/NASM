%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;
num_a	db 'Enter a number (A) : ', 0x00
num_b	db 'Enter a number (B) : ', 0x00
result	db 'A + B = ', 0x00
	segment	.text
	global 	main
main
	enter	0,0		; setup stack frame
	pusha
	mov eax, num_a
	call	print_string
	call	read_int
	mov ebx, eax
	mov eax, num_b
	call	print_string
	call	read_int
	adc ebx, eax
	mov eax, result
	call	print_string
	mov eax, ebx
	call	print_int
	call	print_nl
	
	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
