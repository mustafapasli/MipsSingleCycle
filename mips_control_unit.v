module mips_control_unit(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp, Opcode);

	input [5:0] Opcode;
	
	output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
	output [2:0] ALUOp;
	
	wire Opcode5not, Opcode4not, Opcode3not, Opcode2not, Opcode1not, Opcode0not;
	wire Rtype, LW, SW, Beq, Andi, Ori, jmp, Addiu ;
	wire LWnot, SWnot, Beqnot, Andinot, Orinot, jmpnot, Addiunot ;
	
	not(Opcode5not, Opcode[5]);
	not(Opcode4not, Opcode[4]);
	not(Opcode3not, Opcode[3]);
	not(Opcode2not, Opcode[2]);
	not(Opcode1not, Opcode[1]);
	not(Opcode0not, Opcode[0]);
	
	and(Rtype, Opcode5not, Opcode4not, Opcode3not, Opcode2not, Opcode1not, Opcode0not);
	and(LW, Opcode[5], Opcode4not, Opcode3not, Opcode2not, Opcode[1], Opcode[0]);
	and(SW, Opcode[5], Opcode4not, Opcode[3], Opcode2not, Opcode[1], Opcode[0]);
	and(Beq, Opcode5not, Opcode4not, Opcode3not, Opcode[2], Opcode1not, Opcode0not);
	and(Andi, Opcode5not, Opcode4not, Opcode[3], Opcode[2], Opcode1not, Opcode0not);
	and(Ori, Opcode5not, Opcode4not, Opcode[3], Opcode[2], Opcode1not, Opcode[0]);
	and(jmp, Opcode5not, Opcode4not, Opcode3not,Opcode2not, Opcode[1], Opcode0not);
	and(Addiu, Opcode5not, Opcode4not, Opcode[3], Opcode2not, Opcode1not, Opcode[0]);

	//------------------- RegDst Signal  --------------------// 
	
	or(RegDst, Rtype, 1'b0);
	
	//------------------- ALUSrc Signal  --------------------// 
	
	or(ALUSrc, LW, SW, Andi, Ori, Addiu);
	
	//------------------- MemtoReg Signal  ------------------// 
	
	or(MemtoReg, LW, 1'b0);

	//------------------- RegWrite Signal  ------------------// 
	
	or(RegWrite, Rtype, LW, Andi, Ori, Addiu);
	
	//------------------- MemRead Signal  -------------------// 
	
	or(MemRead, LW, 1'b0);
	
	//------------------- MemWrite Signal  ------------------// 
	
	or(MemWrite, SW, 1'b0);
	
	//-------------------   Branch Signal  ------------------// 
	
	or(Branch, Beq, 1'b0);
	
	//------------------- Jump Signal  ------------------// 
	
	or(Jump, jmp, 1'b0);
	
	//------------------- ALUOp Signal  ------------------// 
	
	not(LWnot, LW);
	not(SWnot, SW);
	not(Beqnot, Beq);
	not(Andinot, Andi);
	not(Orinot, Ori);
	not(jmpnot, jmp);
	not(Addiunot, Addiu);
	
	and(ALUOp[2], Andinot, Orinot, Addiunot, LWnot, SWnot);
	and(ALUOp[1], Andinot, Orinot, Beqnot);
	and(ALUOp[0], Andinot, Addiunot, LWnot, SWnot, Beqnot);
	
	endmodule
	



