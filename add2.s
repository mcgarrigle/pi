
// gcc -o add2 add2.s

.data

format: .asciz  "sum is %d = %d + %d\n"

.text
.global main

main:   ldr     r0, =format
        mov     r2, #123
        mov     r3, #111
        add     r1, r2, r3
        bl      printf
        b       exit
   
exit:   mov     r0, #0     /* status -> 0 */
        mov     r7, #1     /* exit is syscall #1 */
        swi     #0         /* invoke syscall */
