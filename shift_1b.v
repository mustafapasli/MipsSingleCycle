module shift_1b(O, B, E, D); // E> eneble , D> direction, F> false=0

	input E, D; 
	input [31:0] B;

	output [31:0] O;
	
	//wire aritmatic;
	
	//and (aritmatic, D, B[31]);

	mux4to1 mux1  (O[0],  E, D, 1'b0,  B[1],  B[0],  B[0]);
	mux4to1 mux2  (O[1],  E, D, B[0],  B[2],  B[1],  B[1]);
	mux4to1 mux3  (O[2],  E, D, B[1],  B[3],  B[2],  B[2]);
	mux4to1 mux4  (O[3],  E, D, B[2],  B[4],  B[3],  B[3]);
	mux4to1 mux5  (O[4],  E, D, B[3],  B[5],  B[4],  B[4]);
	mux4to1 mux6  (O[5],  E, D, B[4],  B[6],  B[5],  B[5]);
	mux4to1 mux7  (O[6],  E, D, B[5],  B[7],  B[6],  B[6]);
	mux4to1 mux8  (O[7],  E, D, B[6],  B[8],  B[7],  B[7]);
	mux4to1 mux9  (O[8],  E, D, B[7],  B[9],  B[8],  B[8]);
	mux4to1 mux10 (O[9],  E, D, B[8],  B[10], B[9],  B[9]);
	mux4to1 mux11 (O[10], E, D, B[9],  B[11], B[10], B[10]);
	mux4to1 mux12 (O[11], E, D, B[10], B[12], B[11], B[11]);
	mux4to1 mux13 (O[12], E, D, B[11], B[13], B[12], B[12]);
	mux4to1 mux14 (O[13], E, D, B[12], B[14], B[13], B[13]);
	mux4to1 mux15 (O[14], E, D, B[13], B[15], B[14], B[14]);
	mux4to1 mux16 (O[15], E, D, B[14], B[16], B[15], B[15]);
	mux4to1 mux17 (O[16], E, D, B[15], B[17], B[16], B[16]);
	mux4to1 mux18 (O[17], E, D, B[16], B[18], B[17], B[17]);
	mux4to1 mux19 (O[18], E, D, B[17], B[19], B[18], B[18]);
	mux4to1 mux20 (O[19], E, D, B[18], B[20], B[19], B[19]);
	mux4to1 mux21 (O[20], E, D, B[19], B[21], B[20], B[20]);
	mux4to1 mux22 (O[21], E, D, B[20], B[22], B[21], B[21]);
	mux4to1 mux23 (O[22], E, D, B[21], B[23], B[22], B[22]);
	mux4to1 mux24 (O[23], E, D, B[22], B[24], B[23], B[23]);
	mux4to1 mux25 (O[24], E, D, B[23], B[25], B[24], B[24]);
	mux4to1 mux26 (O[25], E, D, B[24], B[26], B[25], B[25]);
	mux4to1 mux27 (O[26], E, D, B[25], B[27], B[26], B[26]);
	mux4to1 mux28 (O[27], E, D, B[26], B[28], B[27], B[27]);
	mux4to1 mux29 (O[28], E, D, B[27], B[29], B[28], B[28]);
	mux4to1 mux30 (O[29], E, D, B[28], B[30], B[29], B[29]);
	mux4to1 mux31 (O[30], E, D, B[29], B[31], B[30], B[30]);
	mux4to1 mux32 (O[31], E, D, B[30], 1'b0,  B[31], B[31]);

endmodule