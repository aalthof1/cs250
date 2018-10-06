.section	.data
firstPrompt:	.asciz "Please enter the first number: "
firstNum:	.word 1
numIn:		.asciz "%d"
.section	.text
.global		.main
main:
	
	ldr r0, =firstPrompt
	bl printf
	
	ldr r0, =numIn
	ldr r1, =firstNum
	bl scanf

	mov r7, $0
	svc $0
	.end
