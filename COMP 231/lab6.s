.global _start
__default_stacksize=1024
_start:
	movia sp, STACK
	
	#get value from switches
	call read
	#move read output from r2 to r4 for fact call
	mov r4, r2
	
	call fact
	
	#move fact output from r2 to r4 for printHex call
	mov r4, r2
	call printHex
	
	finish: br finish
read:
	movia r9, 0x10000040 #addr of switches
	ldwio r2, 0(r9) #load switches into r2
	ret

fact:
	#startup
	subi sp, sp, 8
	stw ra, 0(sp) #store ra
	
	mov r15, r4 #put n in r15 for recursion
	
	if: bne r4, r0, else #if (n==0)
		movi r2, 1 #return 1
		br fact_done
	else: subi r4, r4, 1 #n=n-1
		  
		  #prologue
		  stw r15, 4(sp) #caller save register

		  call fact
		 
		  #epilogue
		  ldw r15, 4(sp) #caller save register

		  mul r2, r15, r2 #n*fact(n-1)
	fact_done: #cleanup
		  ldw ra, 0(sp) #restore ra
		  addi sp, sp, 8 #deallocate stack
		  ret

printHex:
	#startup
	subi sp, sp, 28
	stw ra, 0(sp) #since printHex is a caller, save ra
	
	
	movi r9, 0 #for looping - # of bits to shift
	movi r10, 12 #for comparison - max # of bits to shift
	movi r11, 0 #to store sum of SSD hex values
	movia r13, 0x10000020 #addr of SSD
	mov r14, r4 #store original input for manipulation
	
	#andhi r4, r4, 0x0000 #take lower 16 bits of input
	
	while: 
		bgt r9, r10, hex_done #while r9 <= 12
		
		srl r12, r14, r9 #shift input (r14) right by r9
		andi r12, r12, 0x000f #last four bits
		
		#prologue (caller save registers)
		stw r9, 4(sp)
		stw r10, 8(sp)
		stw r11, 12(sp)
		stw r12, 16(sp)
		stw r13, 20(sp)
		stw r14, 24(sp)
		
		mov r4, r12 #r12 is parameter for lookup func call
		
		call lookup
		
		#epilogue
		ldw r9, 4(sp)
		ldw r10, 8(sp)
		ldw r11, 12(sp)
		ldw r12, 16(sp)
		stw r13, 20(sp)
		stw r14, 24(sp)
		#take output and shift left by r9*2, add to r11
		muli r15, r9, 2 #need to multiply r9 
		sll r2, r2, r15
		add r11, r11, r2 #r11 stores values for SSD
		
		addi r9, r9, 4 #increment r9 by 4
		br while
	hex_done:
		  stwio r11, 0(r13) #write to SSD
		  #cleanup
		  ldw ra, 0(sp)
		  addi sp, sp, 28
		  ret

lookup:
	movia r9, lut #&lut[0]
	muli r10, r4, 4 #val*4
	add r9, r9, r10 #&lut[i] = &lut[0] + val*4
	ldw r2, 0(r9) #load from lut into r2 for return val
	ret 

.data
lut: #stores hex values for 7-segment display
.word 0xbf #illuminates 0
.word 0x86 #1
.word 0xdb #2
.word 0xcf #3
.word 0xe6 #4
.word 0x6d #5
.word 0xfd #6
.word 0x87 #7
.word 0xff #8
.word 0xef #9
.word 0xf7 #a
.word 0xfc #b
.word 0xb9 #c
.word 0xde #d
.word 0xf9 #e
.word 0xf1 #f
.skip __default_stacksize
STACK:
.end