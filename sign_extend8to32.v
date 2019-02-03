module sign_extend8to32(bit_32 ,bit_8);

input [7:0] bit_8;
output [31:0] bit_32;

buf(bit_32[0],  bit_8[0]);
buf(bit_32[1],  bit_8[1]);
buf(bit_32[2],  bit_8[2]);
buf(bit_32[3],  bit_8[3]);
buf(bit_32[4],  bit_8[4]);
buf(bit_32[5],  bit_8[5]);
buf(bit_32[6],  bit_8[6]);
buf(bit_32[7],  bit_8[7]);
buf(bit_32[8],  bit_8[7]);
buf(bit_32[9],  bit_8[7]);
buf(bit_32[10], bit_8[7]);
buf(bit_32[11], bit_8[7]);
buf(bit_32[12], bit_8[7]);
buf(bit_32[13], bit_8[7]);
buf(bit_32[14], bit_8[7]);
buf(bit_32[15], bit_8[7]);
buf(bit_32[16], bit_8[7]);
buf(bit_32[17], bit_8[7]);
buf(bit_32[18], bit_8[7]);
buf(bit_32[19], bit_8[7]);
buf(bit_32[20], bit_8[7]);
buf(bit_32[21], bit_8[7]);
buf(bit_32[22], bit_8[7]);
buf(bit_32[23], bit_8[7]);
buf(bit_32[24], bit_8[7]);
buf(bit_32[25], bit_8[7]);
buf(bit_32[26], bit_8[7]);
buf(bit_32[27], bit_8[7]);
buf(bit_32[28], bit_8[7]);
buf(bit_32[29], bit_8[7]);
buf(bit_32[30], bit_8[7]);
buf(bit_32[31], bit_8[7]);

endmodule