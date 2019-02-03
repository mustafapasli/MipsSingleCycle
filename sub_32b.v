module sub_32b(O, V,C_out, A, B, C_in);

	input [31:0] A;
	input [31:0] B;
	input C_in;

	output [31:0] O;
	output C_out, V;

	wire [30:0] subsub;

	sub_full subtractor1  (O[0], subsub[0],  A[0],  B[0],  C_in);
	sub_full subtractor2  (O[1], subsub[1],  A[1],  B[1],  subsub[0]);
	sub_full subtractor3  (O[2], subsub[2],  A[2],  B[2],  subsub[1]);
	sub_full subtractor4  (O[3], subsub[3],  A[3],  B[3],  subsub[2]);
	sub_full subtractor5  (O[4], subsub[4],  A[4],  B[4],  subsub[3]);
	sub_full subtractor6  (O[5], subsub[5],  A[5],  B[5],  subsub[4]);
	sub_full subtractor7  (O[6], subsub[6],  A[6],  B[6],  subsub[5]);
	sub_full subtractor8  (O[7], subsub[7],  A[7],  B[7],  subsub[6]);
	sub_full subtractor9  (O[8], subsub[8],  A[8],  B[8],  subsub[7]);
	sub_full subtractor10 (O[9], subsub[9],  A[9],  B[9],  subsub[8]);
	sub_full subtractor11 (O[10],subsub[10], A[10], B[10], subsub[9]);
	sub_full subtractor12 (O[11],subsub[11], A[11], B[11], subsub[10]);
	sub_full subtractor13 (O[12],subsub[12], A[12], B[12], subsub[11]);
	sub_full subtractor14 (O[13],subsub[13], A[13], B[13], subsub[12]);
	sub_full subtractor15 (O[14],subsub[14], A[14], B[14], subsub[13]);
	sub_full subtractor16 (O[15],subsub[15], A[15], B[15], subsub[14]);
	sub_full subtractor17 (O[16],subsub[16], A[16], B[16], subsub[15]);
	sub_full subtractor18 (O[17],subsub[17], A[17], B[17], subsub[16]);
	sub_full subtractor19 (O[18],subsub[18], A[18], B[18], subsub[17]);
	sub_full subtractor20 (O[19],subsub[19], A[19], B[19], subsub[18]);
	sub_full subtractor21 (O[20],subsub[20], A[20], B[20], subsub[19]);
	sub_full subtractor22 (O[21],subsub[21], A[21], B[21], subsub[20]);
	sub_full subtractor23 (O[22],subsub[22], A[22], B[22], subsub[21]);
	sub_full subtractor24 (O[23],subsub[23], A[23], B[23], subsub[22]);
	sub_full subtractor25 (O[24],subsub[24], A[24], B[24], subsub[23]);
	sub_full subtractor26 (O[25],subsub[25], A[25], B[25], subsub[24]);
	sub_full subtractor27 (O[26],subsub[26], A[26], B[26], subsub[25]);
	sub_full subtractor28 (O[27],subsub[27], A[27], B[27], subsub[26]);
	sub_full subtractor29 (O[28],subsub[28], A[28], B[28], subsub[27]);
	sub_full subtractor30 (O[29],subsub[29], A[29], B[29], subsub[28]);
	sub_full subtractor31 (O[30],subsub[30], A[30], B[30], subsub[29]);
	sub_full subtractor32 (O[31],C_out,      A[31], B[31], subsub[30]);

	xor overflow (V, C_out, subsub[30]);

endmodule