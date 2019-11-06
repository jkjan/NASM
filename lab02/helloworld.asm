%include "asm_io.inc"

segment .data
msg db "Hello World!", 0x0a, 0x00

segment .text
global main

main:
enter 0,0
mov eax, msg
call print_string


leave
ret
