.globl lab03c

lab03c:
	MOV X0, #0 //i=0
	ADRP X1, j //load address of j into x1
	ADD X1, X1, :lo12:j  
	LDUR X1,[X1,#0] //load j
	ADRP X2, my_array //load address of my_array into X2
	ADD X2, X2, :lo12:my_array  
	
loop:
	CMP X0, #10
	BGE finish //if x>= 10 go to finish
	STUR X1, [X2, 0] //store j at my_array[i]
	ADD X2, X2, #8
	ADD X0, X0, #1 //i++
	ADD X1, X1, #1 //j++
	B loop //go to loop
	
finish:
	BR X30 //return i

.section .data
	my_array: .space 80
	j: .quad 1

