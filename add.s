// $ as -o hello.o hello.s
// $ ld -o hello hello.o

.data

buffer:     .long   0


.text
.global _start

_start:
    mov     r1, #1
    mov     r2, #2
    add     r0, r1, r2
    add     r0, r0, #48
    bl      putc
    mov     r0, #10
    bl      putc
    b       exit
   
exit:
    mov     r0, #0     /* status -> 0 */
    mov     r7, #1     /* exit is syscall #1 */
    swi     #0         /* invoke syscall */

putc:
    ldr     r1, =buffer
    str     r0, [r1]
    mov     r0, #1     /* fd -> stdout */
    mov     r2, #1     /* count -> 1 */
    mov     r7, #4     /* write is syscall #4 */
    swi     #0         /* invoke syscall */
    mov     pc, lr

