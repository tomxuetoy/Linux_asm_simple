# Text segment begins
.section .text

   .globl _start

# Program entry point
   _start:

    #arch/x86/include/asm/unistd_32.h
    #define __NR_restart_syscall      0
    #define __NR_exit  1
    #define __NR_fork  2
    #define __NR_read  3
    #define __NR_write  4
	
# Put the code number for system call
      movl  $1, %eax

/* Return value */
      movl  $2, %ebx

# Call the OS
      int   $0x80
