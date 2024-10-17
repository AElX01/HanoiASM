.text
	lui s0, 0x10010 # FIRST DATA SEGMENT MEMORY ADDRESS POINTER (USED TO ACCOMODATE VALUES ON TOWERS)
	
	# TOWER A -> 0x10010 + 0x0
	# TOWER B -> 0x10010 + 0x4
	# TOWER C -> 0x10010 + 0x8
	
	addi s1, zero, 0x3 # N
	addi a2, zero, 0x1 # DISC 1
	addi a3, zero, 0x2 # DISC 2
	addi a4, zero, 0x3 # DISC 3
	
	# LOAD DISCS ON THEIR INITIAL POSITION (TOWER A)
	sw a2, 0x0(s0) 
	sw a3, 0x20(s0)
	sw a4, 0x40(s0)
	
	
	jal towerOfHanoi
	
	
towerOfHanoi:
	addi t0, zero, 1 # INITIALIZATION OF INTEGER VALUE TO COMPARE WITH N
	beq s1, t0, TRUE # "if (n == 1)"
	 
	
TRUE: nop
