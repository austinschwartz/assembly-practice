/* sumarray.s */
        .section        data
        .align  2
        .comm   a, 24, 4

        .section        .rodata
format:
        .asciz  "%d"

        .text
addrFormat:
        .word   format
addra: 
        .word   a
        .global main

main:  
        stmfd   sp!, {r4, r5, fp, lr}
        mov     r3, #0
        mov     r2, #4
skip:  
        cmp     r3, r2 /* if (count > 4) return */
        bgt     endskip

        mov     r4, r3
        mov     r5, #4
        mul     r4, r4, r5
        add     r4, r1, r4
        mov     r1, r4
        ldr     r0, addrFormat
        bl      scanf /* scanf("%d", (*char)(a + (i * 4))) */


endskip:
        mov     r3, #0 /* i = 0 */
        mov     r2, #0
/* sums all of the array elements */
while:

        cmp     r3, r0 /* if (r3 == 0) return */
        beq     endsum

        mov     r4, r3
        mov     r5, #4
        mul     r4, r4, r5
        add     r4, r1, r4
        ldr     r4,[r4] /* r4 = *(a + (i * 4)) */

        add     r2, r2, r4

        mov     r5, #1
        add     r3, r3, r5 /* i += 1 */

        b       while

endsum:
        mov     r1, r2
        ldr     r0, addrFormat
        bl      printf /* printf("%d", sum); */

        ldmfd   sp!, {r4, r5, fp, pc}