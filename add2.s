
// gcc -o add2 add2.s

.include "syscall.h"

.data

format: .asciz  "sum is %d = %d + %d\n"

.text
.global main

main:   ldr     r0, =format    @ printf("sum is %d = %d + %d\n", r1, r2 ,r3)
        mov     r2, #123
        mov     r3, #111
        add     r1, r2, r3
        bl      printf
        b       exit
   
exit:   mov     r0, #0
        mov     r7, #sys_exit
        swi     #0
