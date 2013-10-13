.text
    .global main
main:
    stmfd   sp!, {fp, lr}
    mov     r2, #2
    mov     r3, #3
    add     r1, r2, r3

    ldr     r0, printfArgAddr
    bl      printf

    ldmfd   sp!, {fp, pc}

printfArgAddr:
    .word   printfArg

.section .rodata
printfArg:
    .ascii  "c=%d\n" 

