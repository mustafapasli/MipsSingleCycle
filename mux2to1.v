module mux2to1(O, S, B0, B1);

	input S, B0, B1;
	output O;
	wire Snot , AandSnot, BandS;

	not (Snot, S);
	and (AandSnot, B0, Snot);
	and (BandS, B1, S);
	or (O, AandSnot, BandS);

endmodule 