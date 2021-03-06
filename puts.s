
// $ as -o puts.o puts.s
// $ ld -o puts puts.o

.include "syscall.h"


.data

buffer: .long  0
msg:    .asciz "Hello World!\n"

.text
.global _start

_start: ldr     r0, =msg
        bl      puts
        b       exit
   
exit:   mov     r0, #0          @ status = 0
        mov     r7, #sys_exit
        swi     #0

puts:   push    {r0, r1, lr}
        mov     r1, r0
loop:   ldrb    r0, [r1]
        cmp     r0, #0
        beq     done
        bl      putc
        add     r1, r1, #1
        b       loop
done:   pop     {r0, r1, pc}

putc:   push    {r0, r1, r2, r7, lr}
        ldr     r1, =buffer
        strb    r0, [r1]
        mov     r0, #1          @ stdout = 1
        mov     r2, #1          @ count  = 1
        mov     r7, #sys_write
        swi     #0
        pop     {r0, r1, r2, r7, pc}

