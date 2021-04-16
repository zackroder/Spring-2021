.global _start
_start:
	movia r2, 0x10000040 #address of switches
	movia r3, 0x10000020 #address of seven segment displays
	movia r4, 0x10000010 #address of green LEDs
	movia r17, lut #address of lut
	loop:
	ldbio r6, 0(r2) #read value from switches
	stwio r6, 0(r4) #writes to LEDs
	#andi r6, r6, 0x0f
	
	andi r7, r6, 0x0f #save bottom bits (right display)
	muli r7, r7, 4 #&lut[i] = &lut + i*4
	add r7, r17, r7 # &lut[i] = &lut + i*4
	ldw r8, 0(r7) #load from lut
	
	andi r9, r6, 0xf0 #first four bits (for left display)
	srli r9, r9, 4 #shift right 4 bits
	muli r9, r9, 4 #&lut[i] = &lut + i*4
	add r9, r17, r9 # &lut[i] = &lut + i*4
	ldw r10, 0(r9) #load from lut
	
	slli r10, r10, 8 #shift value left 8 bits (for leftmost display)
	#add two together to output to displays
	add r8, r10, r8
	
	#load to displays
	stwio r8, 0(r3)
	br loop
	
br loop
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

.end	
	