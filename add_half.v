module add_half (S, C, A, B);
	input A, B;
	output S,C;
	wire AnandB;

	xor(S,A,B);
	nand(AnandB,A,B);
	not(C,AnandB);

endmodule