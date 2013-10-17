/* extern int addarray(int n, int* arr) */
	.text
	.global addarray

addarray:
	stmfd	sp!, {r4, r5, fp, lr}

	mov	r2, #0
	mov	r3, #0

while:
	cmp	r3, r0
	beq	endsum

	mov	r4, r3
	mov	r5, #4
	mul	r4, r4, r5
	add	r4, r1, r4
	ldr	r4,[r4]

	add	r2, r2, r4

	mov	r5, #1
	add	r3, r3, r5

	b	while

endsum:
	mov	r0, r2

	ldmfd	sp!, {r4, r5, fp, pc}

