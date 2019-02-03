`define DELAY 20
module mips_control_unit_testbench();
reg [5:0] Opcode;

wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
wire [2:0] ALUOp;

//module mips_control_unit(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp, Opcode);
mips_control_unit mcutb(.RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .Jump(Jump), .ALUOp(ALUOp), .Opcode(Opcode));

initial begin

		
		Opcode = 6'b000000;
		
		#`DELAY;
	
		Opcode = 6'b001100;
		
		#`DELAY;
		
		Opcode = 6'b001101;
		
		#`DELAY;
		
		Opcode = 6'b001001;
		
		#`DELAY;
		
		Opcode = 6'b100011;
		
		#`DELAY;
		
		Opcode = 6'b101011;
		
		#`DELAY;
		
		Opcode = 6'b000100;
		
		#`DELAY;
		
		Opcode = 6'b000010;
		
		#`DELAY;

end

initial begin
$monitor("time= %2d, RegDst= %1b, ALUSrc= %1b, MemtoReg= %1b, RegWrite= %1b, MemRead= %1b, MemWrite= %1b, Branch= %1b, Jump= %1b, ALUOp= %3b, Opcode  = %6b",$time, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp, Opcode);
end

endmodule