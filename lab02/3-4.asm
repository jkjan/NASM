%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;
num_a	db 'Enter a number (A) : ', 0x00
num_b	db 'Enter a number (B) : ', 0x00
result_plus	db 'A + B = ', 0x00
result_minus	db 'A - B = ', 0x00
result_mult	db 'A * B = ', 0x00
result_divid	db 'A / B = ', 0x00
comma	db ', ', 0x00
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
	mov ecx, eax

	mov eax, result_plus
	call	print_string

	mov eax, ebx
	adc eax, ecx
	call	print_int
	call	print_nl

	mov eax, result_minus
	call	print_string

	mov eax, ebx
	sbb eax, ecx
	call	print_int
	call	print_nl

	mov eax, result_mult
	call	print_string

	mov eax, ebx
	mul	ecx
	call	print_int
	call	print_nl

	mov eax, result_divid
	call	print_string
	
	mov eax, ebx
	div	cx
	call	print_int

	mov eax, comma
	call	print_string

	mov eax, edx
	call	print_int
	call	print_nl

	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;

	popa
	mov	ax, 0	; return value
	leave			; leave stack frame
	ret
