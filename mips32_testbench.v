module mips32_testbench ();

reg [31:0] instruction;
wire [31:0] result;
	
mips32 m32tb(result, instruction);
//module mips32(result, instruction);	

	initial begin
	instruction = 32'b00000000010000110000000000100000; #100; //  r[2]  + r[3]  = r[0] 
	instruction = 32'b00000000010000110100100000100000; #100; //  r[2]  + r[3]  = r[9]
 	instruction = 32'b00000000010000110101000000100001; #100; //  r[2]  + r[3]  = r[10]
	instruction = 32'b00000000010000110101100000100100; #100; //  r[2]  & r[3]  = r[11]
	instruction = 32'b00000000010000110110000000100111; #100; //~(r[2]  | r[3]) = r[12]
	instruction = 32'b00000000010000110110100000100101; #100; //  r[2]  | r[3]  = r[13]
	instruction = 32'b00000000010000110111000000101011; #100; //  r[14] =(r[2]  < r[3]) ? 1:0 
	instruction = 32'b00000000011000100111100000101011; #100; //  r[15] =(r[3]  < r[2]) ? 1:0  	
	instruction = 32'b00000000010111111000000011000000; #100; //  r[16] = r[31] << 3
	instruction = 32'b00000000010111111000100011000010; #100; //  r[17] = r[31] >> 3
	instruction = 32'b00000000010000111010000000100010; #100; //  r[2]  - r[3] = r[20]
	instruction = 32'b00000000010000111010100000100011; #100; //  r[2]  - r[3] = r[21]
	instruction = 32'b00000000011000101011000000100010; #100; //  r[3]  - r[2] = r[22]
	instruction = 32'b00000000011000101011100000100011; #100; //  r[3]  - r[2] = r[23]

	end

	initial
	begin
	
	$monitor("time = %3d, instruction = %32b, result = %32b", $time, instruction, result);

	end
endmodule