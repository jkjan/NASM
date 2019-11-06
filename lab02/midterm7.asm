%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;

	segment	.text
	global 	main
main
	enter	0,0		; setup stack frame
	pusha

	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;

	mov ebx, 2290649231
	dump_regs 1 

	mov eax, ebx
	sar eax, 2
	dump_regs 2
	
	mov eax, ebx
	shl eax, 1
	dump_regs 3

	mov eax, ebx
	ror eax, 3
	dump_regs 4
	
	mov eax, 1145324615
	rcr eax, 2
	dump_regs 5
	

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
