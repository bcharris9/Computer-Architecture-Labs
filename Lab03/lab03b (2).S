.section .text
.globl lab03b

lab03b:
	ADD X1, XZR, XZR //i=0
	
	ADRP X9, UIN //pointer to UIN
	ADD X9, X9, :lo12:UIN  
	LDUR X0, [X9, 0] // Load address of UIN into X0
	
LOOP:
	CMP X1, #10
	B.GE EXIT // Compare X1 to 10 and branch to EXIT if X1 >= 10
	SUB X0, X0, #1 // decrement by 1
	ADD X1, X1, #1 // add 1 to i (X1 + 1)
	
	B LOOP // branch back to loop
	
EXIT:
	STUR X0, [X9, 0] // store final val X0 into mem address pointed to by X9
	BR X30 // branch to return address
	
.section .data
UIN:
	.word 17
