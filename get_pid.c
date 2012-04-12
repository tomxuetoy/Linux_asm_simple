#include <stdio.h>

int pid;

int main() {
        __asm__(
                "movl $20, %eax    \n"
                "call *%gs:0x10    \n"   /* Here, the offset (0x10) is platform-dependent
                                            The memory page %gs:0x10 is located in the VDSO 
                                            In the libc, making a system call is just a matter of calling a VDSO's function, 
                                            without knowing if a historical interrupt will be done or a sysenter. */
                "movl %eax, pid    \n"
        );
        printf("pid is %d\n", pid);
        return 0;

}
