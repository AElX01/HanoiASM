# =======HANOI TOWERS ON RISC-V ASSEMBLY=======
# AUTHOR: Daniel Alejandro Juarez Mota
# =============================================


.text
	addi s0, zero, 0x3 # N
	lui s1, 0x10010 # POINTER TO TOWER A -> SRC
	addi s2, s1, 0x4 # TOWER B -> AUX
	addi s3, s1, 0x8 # TOWER C -> DST
	addi s2, s2, 0x60 # BOTTOM TOWER B
	addi s3, s3, 0x60 # BOTTOM TOWER C
	
LOOP:	blt t0, s0, ACCOMMODATE_DISKS # FOR LOOP TO ACCOMMODATE DISKS ON THE .DATA SECTION
	lui s1, 0x10010 # RESTORES TOWER A POINTER
	jal towerOfHanoi # FIRST CALL towerOfHanoi(n, 'A', 'C', 'B');
	jal exit
	
ACCOMMODATE_DISKS:
	addi t0, t0, 0x1 # FOR EACH DISK, ACCOMMODATE ON THE NEXT ROW OF THE FIRST .DATA SECTION COLUMN, WHERE ROWS ARE TOWERS
	sw t0, 0x0(s1)
	addi s1, s1, 0x20
	jal LOOP
	
	
towerOfHanoi:
	addi t0, zero, 0x1 # BASE CASE CONDITION
	beq s0, t0, TRUE # BASE CASE TO STOP RECURSIVE CALLS
	
	addi sp, sp, -0x4 # MEMORY ALLOCATION SPACE TO STORE "RA" AND N 
	sw ra, 0x0(sp) # PUSH RA TO STACK
	addi sp, sp, -0x4
	sw s0, 0x0(sp) # PUSH N TO STACK
	addi s0, s0, -0x1 # (N - 1)
	
	# ----- SWAP ARGUMENTS (MOVE DISKS TO THE RIGHT) -----
	add t1, s2, zero # AUX -> TEMP
	add s2, s3, zero # AUX -> DST
	add s3, t1, zero # DST -> AUX/TEMP
	
	jal towerOfHanoi # FIRST RECURSIVE CALL towerOfHanoi(n-1, from_rod, aux_rod, to_rod)
	
	# ----- SWAP ARGUMENTS (MOVE DISKS TO THE LEFT) -----
	add t1, s2, zero # AUX -> TEMP
	add s2, s3, zero # AUX -> DST
	add s3, t1, zero # DST -> AUX/TEMP
	
	lw s0, 0x0(sp) # POP N OF THE STACK
	addi sp, sp, 0x4
	lw ra, 0x0(sp) # POP RA OF THE STACK
	addi sp, sp, 0x4
	
	
	sw zero, 0x0(s1) # CLEARS TOP OF TOWER 
	addi s1, s1, 0x20 # DECREASE TOP OF TOWER
	addi s3, s3, -0x20 # INCREASE TOP OF TOWER
        sw s0, 0x0(s3) 
        
        addi sp, sp, -0x4 # MEMORY ALLOCATION SPACE TO STORE "RA" AND N 
	sw ra, 0x0(sp) # PUSH RA TO STACK
	addi sp, sp, -0x4
	sw s0, 0x0(sp) # PUSH N TO STACK
	addi s0, s0, -0x1 # (N - 1)
	
	add t1, s1, zero # TEMP -> SRC
        add s1, s2, zero # SRC -> AUX
        add s2, t1, zero # AUX -> TEMP
        
        jal towerOfHanoi # SECOND RECURSIVE CALL towerOfHanoi(n-1, aux_rod, to_rod, from_rod)
        
        add t1, s1, zero # TEMP -> SRC
        add s1, s2, zero # SRC -> AUX
        add s2, t1, zero # AUX -> TEMP
        
        lw s0, 0x0(sp) # POP N OF STACK
	addi sp, sp, 0x4
	lw ra, 0x0(sp) # POP RA OF THE STACK
	addi sp, sp, 0x4
	
	jalr ra
	
	
TRUE:
	# ----- MANAGE DISK MOVEMENT ON .DATA SECTION -----
	sw zero, 0x0(s1) # CLEARS TOP OF TOWER
	addi s1, s1, 0x20 # DECREASE TOP OF TOWER
	addi s3, s3, -0x20 # INCREASE TOP OF TOWER
        sw s0, 0x0(s3)	
       			
        
        jalr ra	
        
	
exit: nop	
