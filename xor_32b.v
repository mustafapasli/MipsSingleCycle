module xor_32b(O, A, B);

	input [31:0] A;
	input [31:0] B;

	output [31:0] O;

	xor (O[0], A[0], B[0]);
	xor (O[1], A[1], B[1]);
	xor (O[2], A[2], B[2]);
	xor (O[3], A[3], B[3]);
	xor (O[4], A[4], B[4]);
	xor (O[5], A[5], B[5]);
	xor (O[6], A[6], B[6]);
	xor (O[7], A[7], B[7]);
	xor (O[8], A[8], B[8]);
	xor (O[9], A[9], B[9]);
	xor (O[10], A[10], B[10]);
	xor (O[11], A[11], B[11]);
	xor (O[12], A[12], B[12]);
	xor (O[13], A[13], B[13]);
	xor (O[14], A[14], B[14]);
	xor (O[15], A[15], B[15]);
	xor (O[16], A[16], B[16]);
	xor (O[17], A[17], B[17]);
	xor (O[18], A[18], B[18]);
	xor (O[19], A[19], B[19]);
	xor (O[20], A[20], B[20]);
	xor (O[21], A[21], B[21]);
	xor (O[22], A[22], B[22]);
	xor (O[23], A[23], B[23]);
	xor (O[24], A[24], B[24]);
	xor (O[25], A[25], B[25]);
	xor (O[26], A[26], B[26]);
	xor (O[27], A[27], B[27]);
	xor (O[28], A[28], B[28]);
	xor (O[29], A[29], B[29]);
	xor (O[30], A[30], B[30]);
	xor (O[31], A[31], B[31]);


endmodule