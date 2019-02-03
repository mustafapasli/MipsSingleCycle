module mux4to1(O, S0, S1, B0, B1, B2, B3);

input S0, S1, B0, B1, B2, B3;
	output O;

	wire and1, and2, and3, and4;
	wire S0not, S1not;
	
	not not1 (S0not, S0);
	not not2 (S1not, S1);
	
	and and11 (and1, B0, S0not, S1not);
	and and22 (and2, B1, S0not, S1);
	and and33 (and3, B2, S0, S1not);
	and and44 (and4, B3, S0,S1);
	
	or(O, and1, and2, and3, and4);
	
endmodule