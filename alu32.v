module alu32 (R, C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub, A, B, C_in , S0, S1, S2);

	input [31:0] A;
	input [31:0] B;

	input C_in;

	input  S0, S1, S2; 

	output [31:0] R;
	output C_out_sum, C_out_sub ,Zero_bit, V_sum, V_sub;


	wire[31:0] andres;
	wire[31:0] orres;
	wire[31:0] addres;
	wire[31:0] xorres;
	wire[31:0] subres;
	wire[31:0] shiftres;
	wire[31:0] norres;
	
	wire S1not;
	
	not(S1not, S1);

	and_32b   aluand  (andres, A, B);
	or_32b    aluaor  (orres, A, B);
   add_32b   aluadd  (addres, V_sum, C_out_sum, A, B, C_in);
	xor_32b   aluxor  (xorres, A, B);
	sub_32b   alusub  (subres, V_sub, C_out_sub, A, B, C_in);
	shift_32b alushift(shiftres, A, B, S1not);
	nor_32b   alunor  (norres, A, B);	

	mux8to1 mux1  (R[0],  S2,  S1 , S0 ,andres[0]  , orres[0],  addres[0],  xorres[0], subres[0], shiftres[0],  shiftres[0],  norres[0] );
	mux8to1 mux2  (R[1],  S2,  S1 , S0 ,andres[1]  , orres[1],  addres[1],  xorres[1], subres[1], shiftres[1],  shiftres[1],  norres[1] );
	mux8to1 mux3  (R[2],  S2,  S1 , S0 ,andres[2]  , orres[2],  addres[2],  xorres[2], subres[2], shiftres[2],  shiftres[2],  norres[2] );
	mux8to1 mux4  (R[3],  S2,  S1 , S0 ,andres[3]  , orres[3],  addres[3],  xorres[3], subres[3], shiftres[3],  shiftres[3],  norres[3] );
	mux8to1 mux5  (R[4],  S2,  S1 , S0 ,andres[4]  , orres[4],  addres[4],  xorres[4], subres[4], shiftres[4],  shiftres[4],  norres[4] );
	mux8to1 mux6  (R[5],  S2,  S1 , S0 ,andres[5]  , orres[5],  addres[5],  xorres[5], subres[5], shiftres[5],  shiftres[5],  norres[5] );
	mux8to1 mux7  (R[6],  S2,  S1 , S0 ,andres[6]  , orres[6],  addres[6],  xorres[6], subres[6], shiftres[6],  shiftres[6],  norres[6] );
	mux8to1 mux8  (R[7],  S2,  S1 , S0 ,andres[7]  , orres[7],  addres[7],  xorres[7], subres[7], shiftres[7],  shiftres[7],  norres[7] );
	mux8to1 mux9  (R[8],  S2,  S1 , S0 ,andres[8]  , orres[8],  addres[8],  xorres[8], subres[8], shiftres[8],  shiftres[8],  norres[8] );
	mux8to1 mux10 (R[9],  S2,  S1 , S0 ,andres[9]  , orres[9],  addres[9],  xorres[9], subres[9], shiftres[9],  shiftres[9],  norres[9] );
	mux8to1 mux11 (R[10], S2,  S1 , S0, andres[10] , orres[10], addres[10], xorres[10],subres[10],shiftres[10], shiftres[10], norres[10]);
	mux8to1 mux12 (R[11], S2,  S1 , S0, andres[11] , orres[11], addres[11], xorres[11],subres[11],shiftres[11], shiftres[11], norres[11]);
	mux8to1 mux13 (R[12], S2,  S1 , S0, andres[12] , orres[12], addres[12], xorres[12],subres[12],shiftres[12], shiftres[12], norres[12]);
	mux8to1 mux14 (R[13], S2,  S1 , S0, andres[13] , orres[13], addres[13], xorres[13],subres[13],shiftres[13], shiftres[13], norres[13]);
	mux8to1 mux15 (R[14], S2,  S1 , S0, andres[14] , orres[14], addres[14], xorres[14],subres[14],shiftres[14], shiftres[14], norres[14]);
	mux8to1 mux16 (R[15], S2,  S1 , S0, andres[15] , orres[15], addres[15], xorres[15],subres[15],shiftres[15], shiftres[15], norres[15]);
	mux8to1 mux17 (R[16], S2,  S1 , S0, andres[16] , orres[16], addres[16], xorres[16],subres[16],shiftres[16], shiftres[16], norres[16]);
	mux8to1 mux18 (R[17], S2,  S1 , S0, andres[17] , orres[17], addres[17], xorres[17],subres[17],shiftres[17], shiftres[17], norres[17]);
	mux8to1 mux19 (R[18], S2,  S1 , S0, andres[18] , orres[18], addres[18], xorres[18],subres[18],shiftres[18], shiftres[18], norres[18]);
	mux8to1 mux20 (R[19], S2,  S1 , S0, andres[19] , orres[19], addres[19], xorres[19],subres[19],shiftres[19], shiftres[19], norres[19]);
	mux8to1 mux21 (R[20], S2,  S1 , S0, andres[20] , orres[20], addres[20], xorres[20],subres[20],shiftres[20], shiftres[20], norres[20]);
	mux8to1 mux22 (R[21], S2,  S1 , S0, andres[21] , orres[21], addres[21], xorres[21],subres[21],shiftres[21], shiftres[21], norres[21]);
	mux8to1 mux23 (R[22], S2,  S1 , S0, andres[22] , orres[22], addres[22], xorres[22],subres[22],shiftres[22], shiftres[22], norres[22]);
	mux8to1 mux24 (R[23], S2,  S1 , S0, andres[23] , orres[23], addres[23], xorres[23],subres[23],shiftres[23], shiftres[23], norres[23]);
	mux8to1 mux25 (R[24], S2,  S1 , S0, andres[24] , orres[24], addres[24], xorres[24],subres[24],shiftres[24], shiftres[24], norres[24]);
	mux8to1 mux26 (R[25], S2,  S1 , S0, andres[25] , orres[25], addres[25], xorres[25],subres[25],shiftres[25], shiftres[25], norres[25]);
	mux8to1 mux27 (R[26], S2,  S1 , S0, andres[26] , orres[26], addres[26], xorres[26],subres[26],shiftres[26], shiftres[26], norres[26]);
	mux8to1 mux28 (R[27], S2,  S1 , S0, andres[27] , orres[27], addres[27], xorres[27],subres[27],shiftres[27], shiftres[27], norres[27]);
	mux8to1 mux29 (R[28], S2,  S1 , S0, andres[28] , orres[28], addres[28], xorres[28],subres[28],shiftres[28], shiftres[28], norres[28]);
	mux8to1 mux30 (R[29], S2,  S1 , S0, andres[29] , orres[29], addres[29], xorres[29],subres[29],shiftres[29], shiftres[29], norres[29]);
	mux8to1 mux31 (R[30], S2,  S1 , S0, andres[30] , orres[30], addres[30], xorres[30],subres[30],shiftres[30], shiftres[30], norres[30]);
	mux8to1 mux32 (R[31], S2,  S1 , S0, andres[31] , orres[31], addres[31], xorres[30],subres[31],shiftres[31], shiftres[31], norres[31]);

	nor(Zero_bit, R[0],  R[1],  R[2],  R[3],  R[4],  R[5],  R[6],  R[7], 
					  R[8],  R[9],  R[10], R[11], R[12], R[13], R[14], R[15],
					  R[16], R[17], R[18], R[19], R[20], R[21], R[22], R[23],
                 R[24], R[25], R[26], R[27], R[28], R[29], R[30], R[31]);
					  
endmodule