// Compute the logical AND and OR of inputs A and B.
module AND_OR(andOut, orOut, A, B);
	output andOut, orOut;
	input A, B; 
	and TheAndGate (andOut, A, B);
	or TheOrGate (orOut, A, B);
endmodule 

// Compute the logical NAND and NOR of inputs X and Y.
module NAND_NOR(nandOut, norOut, X, Y);
	output nandOut, norOut;
	input X, Y;
	wire andVal, orVal;
	AND_OR aoSubmodule (andVal, orVal, X, Y);
	not n1 (nandOut, andVal);
	not n2 (norOut, orVal);
endmodule 

