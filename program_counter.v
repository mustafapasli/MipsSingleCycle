module program_counter (PC,extend_immt_Value, Branch,zero, signalJump, jump_Address,clk );	
	
	input [31:0] extend_immt_Value;
	input Branch, zero, signalJump;
	input [25:0] jump_Address;
	reg [7:0] programcounter;
	input clk;
	output [7:0] PC ;	  	
	wire [7:0] tempPC [3:0];
	
	//Beq 
	branchInst forBranch(tempPC[0], Branch, zero, programcounter, extend_immt_Value);
   
	//jump 
	jInst jumpInstruction(tempPC[1], signalJump, programcounter, jump_Address);
	
	assign tempPC[2] = PC + 8'b00000001; // instrementing PC 
	
	assign PC = programcounter; // assigning PC to programcounter 
	
	always @(posedge clk) begin
		
		programcounter <= tempPC[2]; // incrementing PC assign to programcounter
		
		if(signalJump == 1'b1) // if instruction is jump 
		begin
			programcounter <= tempPC[1];
		end
		
		if(Branch == 1'b1 && zero == 1'b1) // if instruction is branch
		begin
			programcounter <= tempPC[0]; 
		end										
	end
		
	
	
endmodule

module branchInst (PC, Branch, zero, programcounter, extend_immt_Value); 
	input Branch, zero;
	input [7:0] programcounter;
	input [31:0] extend_immt_Value;
	output [7:0] PC;
	
	wire branchAndZero;
	wire [31:0] tempPC,extendPC;
	wire carryOut;
	wire overflow;
	and(branchAndZero, Branch, zero); // controling alu result and branch signal
	
	sign_extend8to32 se8to32(extendPC, programcounter); // extending program counter to 32 bit 
	add_32b add32(tempPC, overflow, carryOut, extendPC, extend_immt_Value , 1'b1); // adding PC + branch address + 1(as carry bit) 
	
	assign PC = (branchAndZero == 1'b0) ? {programcounter}: // branch PC if branchAndZero true if not assigns PC previous value(programcounter) 
				   (branchAndZero == 1'b1) ? {tempPC[7:0]} : {programcounter};
endmodule

// jump 
module jInst (PC, signalJump, programcounter, jump_Address);

	input [7:0] programcounter;
	input signalJump;
	input [25:0] jump_Address;
	output [7:0] PC;
	wire [7:0] address;
	
	assign address = jump_Address[7:0]; // assigning last 8 bit to address 
	assign PC = (signalJump==0) ? {programcounter}:{address}; // if instruction is jump retuns jump address

endmodule

