module sub_half (S, C, A, B);
	input A, B;
	output S,C;
	wire Anot;

	xor(S,A,B);
	not(Anot, A);
	and(C,Anot,B);
	

endmodule

