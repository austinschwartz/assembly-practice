.section 	.rodata
printfArg:
	.ascii	"c=%d\n"

.section	.data
	.align	2
	
	.comm	a,4,4
	.comm	b,4,4
	.comm	c,4,4

.section	text
addra:	.word a
addrb:	.word b
addrc:	.word c
addrPrintfArg:	.word printfArg

.global main
main:
	stmfd	sp!, {fp, lr}

	/* a = 2 */	
	ldr	r3, addra
	mov	r2, #2
	str	r2, [r3]

	/* b = 3 */
	ldr	r3, addrb
	mov	r2, #3
	str	r2, [r3]

	/* loads contents of a and b into r2 and r3 */	
	ldr	r2, addra
	ldr	r2, [r2]
	ldr	r3, addrb
	ldr	r3, [r3]

	/* c = a + b */
	add	r2, r2, r3
	ldr	r3, addrc
	str	r2, [r3]

	/* prints c = %d */
	ldr	r0, addrPrintfArg
	ldr	r1, addrc
	ldr	r1, [r1]
	bl	printf

	ldmfd	sp!, {fp, pc}
