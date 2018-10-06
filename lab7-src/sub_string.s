.section	.data
.section	.text
.global		sub_string
sub_string:

	push{r4,r14} 			@pushes intial values so they are not altered in program
	sub r1, r1, $1 			@decrements start index to account for us counting from 1
	sub r3, r2, r1 			@sets r3 to be used as a counter for the loop
	add r0, r0, r1 			@moves string to the correct start index
	add r10, r3, $0 		@copies the value from r3 to r10 to allocate size for return string
	
	mov r4, r0 			@moves r0 to r4 so malloc doesnt change the value
	mov r8, r3 			@moves r3 to r8 so malloc doesnt change the value
	
	@*********code to allocate memory for the return string*******
	add r0, r3, $1 			@sets r0 to length+1 for malloc
	bl malloc 			@allocates memory of size length+1 bytes

	loop: 				@loop to copy characters

		ldrb r5, [r4], $1 	@gets byte from input string and increments pointer
		strb r5, [r0], $0 	@puts byte from input string output string
		add r0, r0, $1 		@increments output string pointer to point to next character
		sub r8, r8, $1 		@decrements loop counter
		cmp r8, $0 		@sets compare flag to determine if loop must terminate
		bne loop

	sub r7, r7, r7 			@sets value in r7 to 0
	strb r7, [r0], $0 		@puts null terminator at the end of the output
	sub r0, r0, r10 		@sets r0 to point at the beginning of the string
	pop{r4, r14} 			@pops values back into registers for main
	bx lr 				@returns value in r0 to main

	mov r0, $0
	bl fflush
	mov r7, $1
	svc $0
	.end

