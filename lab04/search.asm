%include "asm_io.inc"

	segment	.data
	;
	; initialized data is put in the data segment here
	;

array	dd	3, 1, 5, 7, 2, 8, 4, 9, 6, 10	;int array[10] = ...
size	dd	10				;int size = 10

	segment	.text
	global 	main
main:
	enter	0,0		; setup stack frame
	pusha

	call	read_int			;scanf("%d", &eax)
	mov	ecx, eax			;int ecx = eax
	mov	edx, 0				;int edx = 0, which will be an index for the array
	mov	eax, -1				;eax = -1

repeat:	
	cmp	[array + edx*4], ecx		;zf = (*(array + edx) == ecx)
	jne	store				;if (zf)
	mov	eax, edx			;	eax = edx
store:
	inc	edx				;edx++
	cmp	edx, [size]			;zf = (edx == size)
	jne	repeat				;if (!zf) goto repeat

	call	print_int			;printf("%d", eax)
	call	print_nl			;printf("\n")

	;
	; code is put in the text segment. Do not modify the code before
	; or after this comment.
	;

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
