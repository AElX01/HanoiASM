# TOWER OF HANOI IN RISC-V ASSEMBLY

## OVERVIEW
This repo contains my implementation of the Tower of Hanoi problem coded in RISC-V assembly as practice from my Computer Organization and Architecture course. The **.asm** file contains the abstraction to RISC-V assembly of the recursive high level solution from **HanoiPseudoCode.c** file from https://www.geeksforgeeks.org/c-program-for-tower-of-hanoi-2:

```c
#include <stdio.h>


void towerOfHanoi(int n, char from_rod, char to_rod, char aux_rod)
{
	if (n == 1)
	{
		printf("\n Move disk 1 from rod %c to rod %c", from_rod, to_rod);
		return;
	}
	towerOfHanoi(n-1, from_rod, aux_rod, to_rod);
	printf("\n Move disk %d from rod %c to rod %c", n, from_rod, to_rod);
	towerOfHanoi(n-1, aux_rod, to_rod, from_rod);
}

int main()
{
	int n = 4; // Number of disks
	towerOfHanoi(n, 'A', 'C', 'B'); // A, B and C are names of rods
	return 0;
}
```

## REQUIREMENTS

- RISC-V assembler and runtime emulator (RARS)

## OUTPUT

The program won't generate any output but will show all disk movements in the .data section.