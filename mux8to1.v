module mux8to1 (O, S0, S1, S2, B0, B1, B2, B3, B4, B5, B6, B7);

	input S0, S1, S2, B0, B1, B2, B3, B4, B5, B6, B7;
	output O;

	wire firstMux, secondMux;

	mux4to1 firstMuxResult (firstMux, S1, S2, B0, B1, B2, B3);
	mux4to1 secondMuxResult (secondMux, S1 ,S2, B4, B5, B6, B7);

	mux2to1 lastMuxResult (O, S0, firstMux, secondMux); 

	

endmodule