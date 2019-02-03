// sign extends 16bit to 32 bit 
module sign_extend16to32(bit_32 ,bit_16);

input [15:0] bit_16;
output [31:0] bit_32;

buf(bit_32[0],  bit_16[0]);
buf(bit_32[1],  bit_16[1]);
buf(bit_32[2],  bit_16[2]);
buf(bit_32[3],  bit_16[3]);
buf(bit_32[4],  bit_16[4]);
buf(bit_32[5],  bit_16[5]);
buf(bit_32[6],  bit_16[6]);
buf(bit_32[7],  bit_16[7]);
buf(bit_32[8],  bit_16[8]);
buf(bit_32[9],  bit_16[9]);
buf(bit_32[10], bit_16[10]);
buf(bit_32[11], bit_16[11]);
buf(bit_32[12], bit_16[12]);
buf(bit_32[13], bit_16[13]);
buf(bit_32[14], bit_16[14]);
buf(bit_32[15], bit_16[15]);
buf(bit_32[16], bit_16[15]);
buf(bit_32[17], bit_16[15]);
buf(bit_32[18], bit_16[15]);
buf(bit_32[19], bit_16[15]);
buf(bit_32[20], bit_16[15]);
buf(bit_32[21], bit_16[15]);
buf(bit_32[22], bit_16[15]);
buf(bit_32[23], bit_16[15]);
buf(bit_32[24], bit_16[15]);
buf(bit_32[25], bit_16[15]);
buf(bit_32[26], bit_16[15]);
buf(bit_32[27], bit_16[15]);
buf(bit_32[28], bit_16[15]);
buf(bit_32[29], bit_16[15]);
buf(bit_32[30], bit_16[15]);
buf(bit_32[31], bit_16[15]);

endmodule