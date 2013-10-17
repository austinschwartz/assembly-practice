/* Takes a string in stdin and outputs the length of the string */
	.section data
	.align	2
	.comm	string, 256, 4

	.section .rodata
format:
	.asciz	"%d\n"
	
	.text
addrstring:
	.word	string
addrformat:
	.word	format

	.global main
main:
	stmfd	sp!, {r4, r5, fp, lr}
	ldr	r0, addrstring
	bl	gets
	mov	r5, #0 /* int count = 0 */
	ldr	r4, addrstring

while:
	ldrb	r2, [r4] /* r2 = string[i] */
	mov	r3, #0
	cmp	r2, r3 /* if (string[i] == 0) return; */
	beq	endwhile
	mov	r3, #1
	add	r5, r5, r3 /* count++ */
	add	r4, r4, r3 /* string++ */
	bal	while

endwhile:
	ldr	r0, addrformat
	mov	r1, r5
	bl	printf
	
	ldmfd	sp!, {r4, r5, fp, pc}
