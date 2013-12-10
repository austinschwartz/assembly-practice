.text
.global addarray
addarray:
	xorq	%rcx, %rcx /* i */
	xorq	%rdx, %rdx /* sum */
	
for:
	cmpq	%rdi, %rcx
	jge	endfor
	addq	$1, %rcx
	addq	(%rsi), %rdx
	addq	$4, %rsi
	jmp 	for
	
endfor:
	mov	%rdx, %rax
	ret
