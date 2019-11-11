%include "asm_io.inc"

	segment	.data
a	dd   1, 2, 3, 4, 5, 6
rows_a	dd   2
cols_a	dd   3

b	dd   7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9
rows_b	dd   3
cols_b	dd   4

	segment .bss
c	resd  8
rows_c	resd  1
cols_c	resd  1

; A =     B =    
; 1 2 3   7 8 9 1 
; 4 5 6   2 3 4 5
;         6 7 8 9

	segment	.text
	global 	main
main:
	enter	0,0		; setup stack frame
	pusha

	mov	eax, [rows_a]	
	mov	ebx, [cols_b]
	mov	[rows_c], eax
	mov	[cols_c], ebx

	mov	ebx, 0		; i
ffor:
	mov	ecx, 0		; j
sfor:
	mov	ebp, 0		; sum = 0
	mov	esi, 0		; k
	mov	edi, 0
tfor:	
	mov	eax, 4
	mov	edx, [cols_a]
	mul	edx
	mul	ebx		

	mov	eax, [a + eax + esi*4]	; a[i][k]
	mov	edx, [b + edi + ecx*4]	; b[k][j]

	mul	edx
	add	ebp, eax	; a[i][k] * b[k][j]

	inc	esi
	add	edi, 16
	cmp	esi, [cols_a]
	jl	tfor

	mov	eax, 4
	mov	edx, [cols_c]
	mul	edx
	mul	ebx	

	mov	[c + eax + ecx*4], ebp	; c[i][j] = sum

	inc	ecx
	cmp	ecx, [cols_b]
	jl	sfor

	inc	ebx
	cmp	ebx, [rows_a]
	jl	ffor
	
	mov	ebx, 0
pffor:	
	mov	ecx, 0
psfor:
	mov	eax, [c + ebx + ecx*4]
	call	print_int
	mov	eax, 0x09
	call	print_char
	inc	ecx
	cmp	ecx, [cols_c]
	jl	psfor

	call	print_nl

	add	ebx, 16
	cmp	ebx, 32
	jl	pffor

	popa
	mov	eax, 0	; return value
	leave			; leave stack frame
	ret
