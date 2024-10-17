# =======HANOI TOWERS ON RISC-V ASSEMBLY=======
# AUTHOR: Daniel Alejandro Juarez Mota
# =============================================


.text
	addi s0, zero, 0xA # N
	lui s1, 0x10010 # FIRST DATA SEGMENT MEMORY ADDRESS POINTER (USED TO ACCOMODATE VALUES ON TOWERS)	
	
LOOP:	blt t0, s0, TRUE
	jal towerOfHanoi
	
TRUE:
	addi t0, t0, 0x1
	sw t0, 0x0(s1)
	addi s1, s1, 0x20
	jal LOOP
	
	
towerOfHanoi: