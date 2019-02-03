module mux32bit_2to1 (O, S, A, B);

input [31:0] A;
input [31:0] B;
input S;
output [31:0] O;

mux2to1 mux1 (O[0] , S, A[0] , B[0] );
mux2to1 mux2 (O[1] , S, A[1] , B[1] );
mux2to1 mux3 (O[2] , S, A[2] , B[2] );
mux2to1 mux4 (O[3] , S, A[3] , B[3] );
mux2to1 mux5 (O[4] , S, A[4] , B[4] );
mux2to1 mux6 (O[5] , S, A[5] , B[5] );
mux2to1 mux7 (O[6] , S, A[6] , B[6] );
mux2to1 mux8 (O[7] , S, A[7] , B[7] );
mux2to1 mux9 (O[8] , S, A[8] , B[8] );
mux2to1 mux10(O[9] , S, A[9] , B[9] );
mux2to1 mux11(O[10], S, A[10], B[10]);
mux2to1 mux12(O[11], S, A[11], B[11]);
mux2to1 mux13(O[12], S, A[12], B[12]);
mux2to1 mux14(O[13], S, A[13], B[13]);
mux2to1 mux15(O[14], S, A[14], B[14]);
mux2to1 mux16(O[15], S, A[15], B[15]);
mux2to1 mux17(O[16], S, A[16], B[16]);
mux2to1 mux18(O[17], S, A[17], B[17]);
mux2to1 mux19(O[18], S, A[18], B[18]);
mux2to1 mux20(O[19], S, A[19], B[19]);
mux2to1 mux21(O[20], S, A[20], B[20]);
mux2to1 mux22(O[21], S, A[21], B[21]);
mux2to1 mux23(O[22], S, A[22], B[22]);
mux2to1 mux24(O[23], S, A[23], B[23]);
mux2to1 mux25(O[24], S, A[24], B[24]);
mux2to1 mux26(O[25], S, A[25], B[25]);
mux2to1 mux27(O[26], S, A[26], B[26]);
mux2to1 mux28(O[27], S, A[27], B[27]);
mux2to1 mux29(O[28], S, A[28], B[28]);
mux2to1 mux30(O[29], S, A[29], B[29]);
mux2to1 mux31(O[30], S, A[30], B[30]);
mux2to1 mux32(O[31], S, A[31], B[31]);


endmodule