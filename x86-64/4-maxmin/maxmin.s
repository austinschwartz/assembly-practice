.data

.comm a, 8
.comm b, 8

.text

aequals:
	.string "a="
bequals:
	.string "b="
read:
	.string "%d"
max:
	.string "max=%d\n"
min:
	.string "min=%d\n"
avg:
	.string "avg=%d\n"

.global main
main:
	/* "printf("a="); */ 
	movq	$aequals, %rdi
	movq	$0, %rsi
	movq	$0, %rax
	call	printf

	/* "scanf("%d", &a); */ 
	movq	$a, %rsi
	movq	$read, %rdi
	movq	$0, %rax
	call	scanf

	/* "printf("b="); */ 
	movq	$bequals, %rdi
	movq	$0, %rsi
	movq	$0, %rax
	call	printf

	/* "scanf("%d", &b); */ 
	movq	$b, %rsi
	movq	$read, %rdi
	movq	$0, %rax
	call	scanf

	movq	(a), %rcx
	movq	(b), %rdx
	cmpq	%rcx, %rdx
	jge	bgreater

	movq	$max, %rdi
	movq	(a), %rsi
	movq	$0, %rax
	call	printf

	movq	$min, %rdi
	movq	(b), %rsi
	movq	$0, %rax
	call	printf

	jmp	printaverage
	

bgreater:
	movq	$max, %rdi
	movq	(b), %rsi
	movq	$0, %rax
	call	printf

	movq	$min, %rdi
	movq	(a), %rsi
	movq	$0, %rax
	call	printf

printaverage:
	movq	(a), %rbx
	movq	(b), %rax
	addq	%rbx, %rax
	xorq	%rdx, %rdx
	movq	$2, %rcx
	idivq	%rcx
	
	movq	$avg, %rdi
	movq	%rax, %rsi
	movq	$0, %rax
	call	printf

end:
	ret
