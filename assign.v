module assign_5bit(B,A);

input [4:0] A;
output [4:0] B;

buf(B[0], A[0]);
buf(B[1], A[1]);
buf(B[2], A[2]);
buf(B[3], A[3]);
buf(B[4], A[4]);

endmodule

module assign_6bit(B,A);

input [5:0] A;
output [5:0] B;

buf(B[0], A[0]);
buf(B[1], A[1]);
buf(B[2], A[2]);
buf(B[3], A[3]);
buf(B[4], A[4]);
buf(B[5], A[5]);

endmodule

module assign_16bit(B,A);

input [15:0] A;
output [15:0] B;

buf(B[0],  A[0]);
buf(B[1],  A[1]);
buf(B[2],  A[2]);
buf(B[3],  A[3]);
buf(B[4],  A[4]);
buf(B[5],  A[5]);
buf(B[6],  A[6]);
buf(B[7],  A[7]);
buf(B[8],  A[8]);
buf(B[9],  A[9]);
buf(B[10], A[10]);
buf(B[11], A[11]);
buf(B[12], A[12]);
buf(B[13], A[13]);
buf(B[14], A[14]);
buf(B[15], A[15]);

endmodule

module assign_26bit(B,A);

input [25:0] A;
output [25:0] B;

buf(B[0],  A[0]);
buf(B[1],  A[1]);
buf(B[2],  A[2]);
buf(B[3],  A[3]);
buf(B[4],  A[4]);
buf(B[5],  A[5]);
buf(B[6],  A[6]);
buf(B[7],  A[7]);
buf(B[8],  A[8]);
buf(B[9],  A[9]);
buf(B[10], A[10]);
buf(B[11], A[11]);
buf(B[12], A[12]);
buf(B[13], A[13]);
buf(B[14], A[14]);
buf(B[15], A[15]);
buf(B[16], A[16]);
buf(B[17], A[17]);
buf(B[18], A[18]);
buf(B[19], A[19]);
buf(B[20], A[20]);
buf(B[21], A[21]);
buf(B[22], A[22]);
buf(B[23], A[23]);
buf(B[24], A[24]);
buf(B[25], A[25]);

endmodule

