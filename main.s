.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
//using ldr to look the value inside the address
//set register r4 for loading the address of the stack
//each stack address 4-address difference
//r6,r7,r8 is for the exp. of push {r0,r1,r2}
//r9,r10,r11 is for the exp. of push {r2,r0,r1}
_start:
	nop
	mov r1, #101
	mov r2, #16
	mov r0, #48
	push {r0,r1,r2} //first exp. of push {r0,r1,r2}
	ldr r6,[sp] //loading the bottom value in the stack
	add r4,sp,#4//look the second top value
	ldr r7,[r4]//loading value in r7(->sp+4)
	add r4,r4,#4//looking the top value
	ldr r8,[r4]//loading value in r8(sp+8)
	pop {r0,r1,r2} //first exp. of pop {r0,r1,r2}	
	//branch w/o link
	//
	b	label01

label01:
	nop

	push {r2,r0,r1}//second exp. of push {r2,r0,r1}
	ldr r9,[sp] //loading the bottom value in the stack
	add r4,sp,#4//look the second top value
	ldr r10,[r4]//loading value in r10(->sp+4)
	add r4,r4,#4//looking the top value
        ldr r11,[r4]//loading value in r11(sp+8)
	pop {r2,r0,r1}//second exp. of pop {r2,r0,r1}
	//branch w/ link
	//
	bl	sleep

sleep:
	nop
	b	.
