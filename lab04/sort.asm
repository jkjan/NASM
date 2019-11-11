%include "asm_io.inc"

	segment	.data
array	dd   3, 1, 5, 7, 2, 8, 4, 9, 6, 10	; int array[10] = ...
size	dd   10					; int size = 10

	segment	.text
	global 	main
main:
	enter	0,0				; setup stack frame
	pusha

	; I used bubble sort algorithm because it is the most familiar, sir.

	mov	edx, [size]			
	dec	edx				; the first for loop starts with an index of size - 1

ffor:						; for (int i = size - 1; i >= 1; i--) {
	mov	ecx, 0				; the second for loop starts with an index of 0

sfor:						; for (int j = 0; j < i; j++) {
	mov	eax, [array + ecx*4]		
	cmp	eax, [array + ecx*4 + 4]	; zf = (array[j] > array[j+1]) 
	jng	noswap				; if (!zf) goto noswap, so, don't swap if array[j] <= array[j+1]

	mov	ebx, [array + ecx*4 + 4]	; else, swap!
	mov	[array + ecx*4], ebx
	mov	[array + ecx*4 + 4], eax

noswap:						
	inc	ecx
	cmp	ecx, edx			; the condition of repetition the second for loop
	jl	sfor

	dec	edx
	cmp	edx, 1				; the condition of repetition the first for loop
	jge	ffor

	mov	ebx, 0				; the for loop for printing the array. starts with an index of 0
pfor:	
	mov	eax, [array + ebx*4]		; printf("%d", array[i])
	call	print_int

	mov	eax, ' '			
	call	print_char			; printf(" ")
	inc	ebx
	cmp	ebx, [size]			
	jne	pfor				; repeat till the index reaches the size of the array
	
	call	print_nl

	popa
	mov	eax, 0				; return value
	leave					; leave stack frame
	ret
