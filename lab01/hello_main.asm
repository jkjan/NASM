	segment .data
msg 	db 'Hello, world!',0x0A
len 	equ $ - msg 		;length of hello string.

	segment .text
	global main		;must be declared for linker (ld)
main:				;we tell linker where is entry point
	mov eax, 4		;system call number (sys_write)
	mov ebx, 1		;file descriptor (stdout)
	mov ecx, msg		;message to write
	mov edx, len		;message length
	int 0x80		;call kernel

	mov eax, 1		;system call number (sys_exit)
	xor ebx, ebx		;exit status of this program
	int 0x80

