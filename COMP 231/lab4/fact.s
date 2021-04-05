.global _start
_start:
	movia r2, 0x10000000 #addr of red LEDs
	movia r3, 0x10000040 #addr of switches
	
	ldbio r4, 0(r3) #read values from switches
	
	movi r5, 1 #i = 1
	movi r6, 1 #fact = 1

test:
	bgt r5, r4, done # i <= n ?
	mul r6, r6, r5 #fact = fact * i
		
	addi r5, r5, 1 #i++
	br test #repeat
done:	
	stwio r6, 0(r2) #write result to red LEDs
	br done
		
