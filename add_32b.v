module add_32b(O, V, C_out, A, B, C_in);

	input [31:0] A;
	input [31:0] B;
	input C_in;

	output [31:0] O;
	output C_out,V;

	wire [30:0] subsum;

	add_full adder1  (O[0], subsum[0],  A[0],  B[0],  C_in);
	add_full adder2  (O[1], subsum[1],  A[1],  B[1],  subsum[0]);
	add_full adder3  (O[2], subsum[2],  A[2],  B[2],  subsum[1]);
	add_full adder4  (O[3], subsum[3],  A[3],  B[3],  subsum[2]);
	add_full adder5  (O[4], subsum[4],  A[4],  B[4],  subsum[3]);
	add_full adder6  (O[5], subsum[5],  A[5],  B[5],  subsum[4]);
	add_full adder7  (O[6], subsum[6],  A[6],  B[6],  subsum[5]);
	add_full adder8  (O[7], subsum[7],  A[7],  B[7],  subsum[6]);
	add_full adder9  (O[8], subsum[8],  A[8],  B[8],  subsum[7]);
	add_full adder10 (O[9], subsum[9],  A[9],  B[9],  subsum[8]);
	add_full adder11 (O[10],subsum[10], A[10], B[10], subsum[9]);
	add_full adder12 (O[11],subsum[11], A[11], B[11], subsum[10]);
	add_full adder13 (O[12],subsum[12], A[12], B[12], subsum[11]);
	add_full adder14 (O[13],subsum[13], A[13], B[13], subsum[12]);
	add_full adder15 (O[14],subsum[14], A[14], B[14], subsum[13]);
	add_full adder16 (O[15],subsum[15], A[15], B[15], subsum[14]);
	add_full adder17 (O[16],subsum[16], A[16], B[16], subsum[15]);
	add_full adder18 (O[17],subsum[17], A[17], B[17], subsum[16]);
	add_full adder19 (O[18],subsum[18], A[18], B[18], subsum[17]);
	add_full adder20 (O[19],subsum[19], A[19], B[19], subsum[18]);
	add_full adder21 (O[20],subsum[20], A[20], B[20], subsum[19]);
	add_full adder22 (O[21],subsum[21], A[21], B[21], subsum[20]);
	add_full adder23 (O[22],subsum[22], A[22], B[22], subsum[21]);
	add_full adder24 (O[23],subsum[23], A[23], B[23], subsum[22]);
	add_full adder25 (O[24],subsum[24], A[24], B[24], subsum[23]);
	add_full adder26 (O[25],subsum[25], A[25], B[25], subsum[24]);
	add_full adder27 (O[26],subsum[26], A[26], B[26], subsum[25]);
	add_full adder28 (O[27],subsum[27], A[27], B[27], subsum[26]);
	add_full adder29 (O[28],subsum[28], A[28], B[28], subsum[27]);
	add_full adder30 (O[29],subsum[29], A[29], B[29], subsum[28]);
	add_full adder31 (O[30],subsum[30], A[30], B[30], subsum[29]);
	add_full adder32 (O[31],C_out,      A[31], B[31], subsum[30]);

	xor overflow (V, C_out, subsum[30]);
	
endmodule