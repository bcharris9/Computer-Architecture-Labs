.globl factorial

factorial:
	CMP X0, XZR // compare X0 (n) with 0 (XZR is 0)
	BNE recursive // if n != 0, branch to recursive label
	MOV X0, #1 // if n == 0, set X0 to 1 (base case for factorial(0) = 1)
	BR X30 // Return to the caller using the link register X30 which holds the return address

recursive:
	SUB SP, SP, #16 // Decreasing stack pointer by 16 bytes to allocate space on stack for local variables (2 variables where each is 8 bytes)
	STUR X0, [SP, #0] // Stores the value of X19 (which will hold the current value of n) into the first 8 bytes of the stack.
	STUR X30, [SP, #8] // Stores the return address (stored in X30) in the next 8 bytes of the stack.
	SUB X0, X0, #1 // n - 1, stored in X0

	BL factorial // Branches to the factorial function, recursively calling it with n-1. The return address is stored in X30.

	LDUR X1, [SP, #0]
	BL my_mul // Using my_mul to multiply 

	LDUR X30, [SP, #8] // Restores the return address (X30) from the stack, which was saved before the recursive call.
	ADD SP, SP, #16 // Restores the stack pointer (SP) by adding 16 bytes, "popping" the two values (X19 and X30) off the stack.

	BR X30 // Branches to the address stored in X30, returning control to the caller (or to the next frame in the recursion).


// before the recursive call: SP points to a 16-byte area for storing the values of X19 and X30 (return address). The stack grows downward:
// Stack content:
// SP + 0: Saved X19 (current value of n)
// SP + 8: Saved X30 (return address)

// after the recursive call: 
// Stack is restored after loading the values of X19 and X30 back from the stack.
// The stack pointer is reset (SP + 16), and the stack is clean, ready to return to the caller.