.text
	.global main

main:
	stmfd	sp!, {fp, lr}
	ldr 	r0, .hw
	bl 	puts
	ldmfd	sp!, {fp, pc}

.hw:
	.word 	.helloWorld

.helloWorld:
	.ascii	"Hello world!\000"
