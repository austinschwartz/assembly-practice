	.section	.data
	.align	2
	
	.comm	a, 4, 4
	.comm	b, 4, 4

	.text
addra:	.word a
addrb:	.word b
addrPromptA:	.word promptA
addrPromptB:	.word promptB
addrReadA:	.word readA
addrReadB:	.word readB
addrPrintMax:	.word printMax
addrPrintMin:	.word printMin
addrPrintAvg:	.word printAvg

	.global main
main:
	stmfd	sp!, {fp, lr}
	
	ldr	r0, addrPromptA
	bl	printf
	
	ldr	r0, addrReadA
	ldr	r1, addra
	bl	scanf

	ldr	r0, addrPromptB
	bl	printf

	ldr	r0, addrReadB
	ldr	r1, addrb
	bl	scanf

	ldr	r0, addra
	ldr	r0, [r0]
	ldr	r1, addrb
	ldr	r1, [r1]

	cmp	r1, r0
	bgt	bgreater
	
	mov	r1, r0
	ldr	r0, addrPrintMax
	bl	printf
	
	ldr	r1, addrb
	ldr	r1, [r1]
	ldr	r0, addrPrintMin
	bl	printf
	b	printaverage

	ldmfd	sp!, {fp, pc}	

bgreater:

	ldr	r0, addrPrintMax
	bl	printf
	
	mov	r2, r1

	ldr	r0, addrPrintMin
	ldr	r1, addra
	ldr	r1, [r1]
	bl	printf
	b	printaverage

	ldmfd	sp!, {fp, pc}

printaverage:
	ldr	r1, addra
	ldr	r1, [r1]
	ldr	r2, addrb
	ldr	r2, [r2]
	add	r1, r1, r2
	mov	r1, r1, LSR#1

	ldr	r0, addrPrintAvg
	bl	printf
	
	ldmfd	sp!, {fp, pc}

	.section	.rodata
promptA:	.asciz	"a: "
promptB:	.asciz	"b: "
readA:	.asciz	"%d"
readB:	.asciz	"%d"
printMax:	.asciz	"max=%d\n"
printMin:	.asciz	"min=%d\n"
printAvg:	.asciz	"avg=%d\n"
