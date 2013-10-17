/* Takes 2 integers from stdin and prints out the larger of the two */
	.section	.data
	.align	2
	.comm	a, 4, 4 /* int a */
	.comm	b, 4, 4 /* int b */

	.text
	.global main
main:
	stmfd	sp!, {fp, lr}
	
	/* scanf("%d", a); */
	ldr	r0, formatAddr
	ldr	r1, addra
	bl	scanf

	/* scanf("%d", b); */
	ldr	r0, formatAddr
	ldr	r1, addrb
	bl	scanf
	
	ldr	r2, addra
	ldr	r2, [r2]
	ldr	r1, addrb
	ldr	r1, [r1]
	cmp	r1, r2 /* if b > a branch to bgreater */
	bgt	bgreater

	/* a is larger */
	/* printf("%d", a); */
	ldr	r0, formatAddr
	mov	r1, r2	
	bl	printf

	ldmfd	sp!, {fp, pc}
	
bgreater:
	/* printf("%d", b); */
	ldr	r0, formatAddr
	bl	printf
	
	ldmfd	sp!, {fp, lr}

addra:	.word	a
addrb:	.word	b
formatAddr:
	.word	format

	.section	.rodata
format:
	.asciz	"%d"

