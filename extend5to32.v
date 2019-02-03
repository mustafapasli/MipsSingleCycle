module extend5to32(bit_32 ,bit_5);

input [4:0] bit_5;
output [31:0] bit_32;

buf(bit_32[0],  bit_5[0]);
buf(bit_32[1],  bit_5[1]);
buf(bit_32[2],  bit_5[2]);
buf(bit_32[3],  bit_5[3]);
buf(bit_32[4],  bit_5[4]);
buf(bit_32[5],  1'b0);
buf(bit_32[6],  1'b0);
buf(bit_32[7],  1'b0);
buf(bit_32[8],  1'b0);
buf(bit_32[9],  1'b0);
buf(bit_32[10], 1'b0);
buf(bit_32[11], 1'b0);
buf(bit_32[12], 1'b0);
buf(bit_32[13], 1'b0);
buf(bit_32[14], 1'b0);
buf(bit_32[15], 1'b0);
buf(bit_32[16], 1'b0);
buf(bit_32[17], 1'b0);
buf(bit_32[18], 1'b0);
buf(bit_32[19], 1'b0);
buf(bit_32[20], 1'b0);
buf(bit_32[21], 1'b0);
buf(bit_32[22], 1'b0);
buf(bit_32[23], 1'b0);
buf(bit_32[24], 1'b0);
buf(bit_32[25], 1'b0);
buf(bit_32[26], 1'b0);
buf(bit_32[27], 1'b0);
buf(bit_32[28], 1'b0);
buf(bit_32[29], 1'b0);
buf(bit_32[30], 1'b0);
buf(bit_32[31], 1'b0);

endmodule