.global _start
_start:
	movia r2, 0x10000000 #red LEDs addr
	movia r3, 0x10000010 #green LEDs addr
	movia r4, 0x10000040 #switches addr
loop:
	ldbio r6, 0(r4) #read value from switches
	stwio r6, 0(r2) #write value to red LEDs
	br loop