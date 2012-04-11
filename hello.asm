section .data
	hello:     db 'Hello world!',10    ; 'Hello world!' plus a linefeed character
	helloLen:  equ $-hello             ; Length of the 'Hello world!' string
	                                   ; (I'll explain soon)

section .text
	global _start

_start:
    ; kernel source code: arch/x86/include/asm/unistd_32.h
    ; #define __NR_restart_syscall      0
    ; #define __NR_exit  1
    ; #define __NR_fork  2
    ; #define __NR_read  3
    ; #define __NR_write  4
	mov eax,4            ; The system call for write (sys_write)
    ; followed by each parameter, by Tom Xue
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,hello        ; Put the offset of hello in ecx
	mov edx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ; mov edx,[helloLen] to get it's actual value
	int 80h              ; Call the kernel
	
    mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,1            ; Exit with return code of 0 (no error)
