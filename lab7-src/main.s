.section	.data
stringPrompt:	.asciz "Enter a string: "
string:		.space 100
startPrompt:	.asciz "Enter the start index: "
start:		.word 1
endPrompt:	.word "Enter the end index: "
end:		.word 1
outString:	.asciz "The substring of the given string is '%s'\n"
storeString:	.asciz "%s"
storeInt:	.asciz "%d"
.section	.text
.global		main
main:
	@Variables in data
	@	input prompts: stringPrompt, startPrompt, endPrompt
	@	arguments: string, start, end
	@	temporary storage: storeString, storeInt
	@	output: outString

	@prompts user for inputs
	ldr r0, =storeString
	ldr r1, =stringPrompt
	bl printf
	ldr r0, =storeString
	ldr r1, =string
	bl scanf
	ldr r0, =storeString
	ldr r1, =startPrompt
	bl printf
	ldr r0, =storeInt
	ldr r1, =start
	bl scanf
	ldr r0, =storeString
	ldr r1, =endPrompt
	bl printf
	ldr r0, =storeInt
	ldr r1, =end
	bl scanf
	
	@calls sub_string.c
	ldr r0, =string @sets argument 1 to string
	ldr r1, =start
	ldr r1, [r1] @sets argument 2 to start
	ldr r2, =end
	ldr r2, [r2] @sets argument 3 to end
	bl sub_string

	@prints output
	ldr r0, =outString
	mov r1, r3
	bl printf

	@ends the program
	move r0, $0
	bl fflush
	mov r7, $1
	svc $0
	.end
