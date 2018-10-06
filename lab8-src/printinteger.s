.section	.data
.section	.text
.global		printx, printd
printx:

	@ r0 = integer to output
	push {r4, r14}	@save register values to be used after subroutine
	add r4, r0, $0	@copy number to print to r4 so that it is not lost when putchar is called

		@ This loop puts each set of 4 bits onto the stack

	loop:
		and r6, r4, $15	@ r6 = r4 & 0xF; r6 is set to the four least significant bits of r4
		push {r6}	@ pushs the LSB remaining onto the stack
		lsr r4, r4, $4	@ shifts r4 by 4 bits
		add r7, r7, $1  @ increment loop counter
		cmp r4, $0	@ if r4 > 0, continue looping, else continue
		bgt loop

		@ Print loop	

	next:
		
		pop {r6}	@ Pop MSB remaining
		cmp r6, $9	@ If value is greater than 9, branch to handle characters
		bgt big
		add r0, r6, $48	@ Add '0' to value to allign value with ASCII value

		@ Regardless of 0-9 or 10-15, print hex character

	after:
		bl putchar	@ r0 is hex char to print, so print
		sub r7, r7, $1	@ decrement the loop counter
		cmp r7, $0	@ if r7 is zero, branch to end
		beq end
				@ else, continue looping
	b next	
		
		@ If digit is greater than 9, adjust ASCII value to print a-f for 10-15

	big:
		add r0, r6, $87
	bl after	

printd:

	@r0 = integer to output
	@r1 through r5 are used for the bit shift algorithm
	@r7 = loop counter

	push {r4, r14}	@push registers onto stack to remember them for after program execution
	add r4, r0, $0	@copies r0 to r4 so that number to print is not lost with putchar calls
	add r7, r9, $0	@ensures r7 = 0

	@If negative, branch to negative handler, else print for positive numbers

	cmp r0, $0
	blt negative

	@This loop divides by ten. I couldn't get the algorithm on the handout to work, so I implemented the one found at stackoverflow.com/questions/5558492/divide-by-10-using-bit-shifts
	
	positive:

		@This part does a lot of fancy bit shifts. At the end of these lines, r2 contains the quotient and r4 contains the remainder to be printed

		add r5, r4, $0
		lsr r1, r5, $1
		lsr r2, r5, $2
		add r2, r2, r1
		lsr r1, r2, $4
		add r2, r2, r1
		lsr r1, r2, $8
		add r2, r2, r1
		lsr r1, r2, $16
		add r2, r2, r1
		lsr r2, r2, $3
		lsl r3, r2, $2
		add r3, r3, r2
		lsl r3, r3, $1
		sub r4, r5, r3

		@With certain values, this algorithm messess up. This branch fixes that.

		cmp r4, $9
		bgt something		
	back:
				
		add r7, r7, $1 	@increment loop counter
		push {r4}      	@push remainder
		mov r4, r2	@moves quotient to initial position for next loop
		sub r5, r5, r5	@sets r5 to zero to avoid errors
		cmp r4, $0	@if quotient is not zero, continue looping
		beq printing
				@else, branch to printing loop
	b positive

		@These two instructions fixes the cases that are not correct with the bit shift algorithm 

	something:
		sub r4, r4, $10
		add r2, r2, $1
	b back
	
		@Negative handler

	negative:
		add r0, r9, $45	@load '-' into r0
		bl putchar	@print '-'
		sub r4, r9, r4	@r4 = 0 - r4; sets r4 to positive value of r4
	b positive		@handle number like positive number

	

	printing:

		pop {r6}	@pop MSB that is still on stack
		add r0, r6, $48	@add '0' to the number to allign the value with ASCII values
		bl putchar	@print number
		sub r7, r7, $1  @decrement loop counter
		cmp r7, $0	@if loop counter is not zero continue looping
		bgt printing
				@else end
	end:
		pop {r4, r14}	@pop registers to continue program

.end
