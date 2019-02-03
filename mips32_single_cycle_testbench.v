module mips32_single_cycle_testbench ();

reg clk;

always begin
	#50 clk = ~clk;
end
	
mips32_single_cycle m32tbsc(clk);

initial begin

m32tbsc.genPC.programcounter = 8'b00000000;
clk = 0;
	
	// reading files 

	$readmemb(".//instructions.mem", m32tbsc.getInstr.instr_mem);

	$readmemb(".//data.mem", m32tbsc.dm.data_mem);
	
	$readmemb(".//registers.mem", m32tbsc.mr.registers); 


end

always @(negedge clk) begin

	// displaying signals 
	
	$display("regDst= %b, ALUSrc= %b, memtoReg= %b, regWrite= %b, memRead= %b, memWrite= %b, branch= %b, jump= %b, ALUOp= %b, shift= %b, sltu= %b,Zero_bit= %b aluControl= %b",
	m32tbsc.regDst, m32tbsc.ALUSrc, m32tbsc.memtoReg, m32tbsc.regWrite, m32tbsc.memRead, m32tbsc.memWrite, m32tbsc.branch, m32tbsc.jump, m32tbsc.ALUOp, m32tbsc.shift, m32tbsc.sltu, m32tbsc.Zero_bit, m32tbsc.aluControl);
	
	//R Type 
	if(m32tbsc.opcode == 6'b000000)	

	begin
	
		$display(" Instruction: %b\n opcode:%b\n rs:%b\n rt:%b\n rd:%b\n shamt:%b\n functionCode:%b\n",
					m32tbsc.instruction, m32tbsc.opcode, m32tbsc.rs, m32tbsc.rt, m32tbsc.rd,
					m32tbsc.shamt ,m32tbsc.funct);
		
	end


	//I Type 
	
	else if(m32tbsc.opcode == 6'b001001 || m32tbsc.opcode == 6'b001100 || m32tbsc.opcode == 6'b000100 || 
			  m32tbsc.opcode == 6'b100011 || m32tbsc.opcode == 6'b001101 || m32tbsc.opcode == 6'b101011)	begin

		$display(" Instruction: %b\n opcode:%b\n rs:%b\n rt:%b\n  Immediate field:%b\n", 
					m32tbsc.instruction, m32tbsc.opcode, m32tbsc.rs, m32tbsc.rt, m32tbsc.immediate);	
					
	end

	else 
		begin
			$display(" Instruction: %b\n opcode:%b\n Target Adress:%b\n", 
					m32tbsc.instruction, m32tbsc.opcode, m32tbsc.address);																							  
		end
	
	//R Type 
	if(m32tbsc.opcode == 6'b000000)
		begin
			
			 if( m32tbsc.funct == 6'b000000)									
				begin $display(" sll result : %b\n", m32tbsc.result);                  end
			else if( m32tbsc.funct == 6'b000010)									
				begin $display(" srl result : %b\n", m32tbsc.result);                  end
			else if( m32tbsc.funct == 6'b100000)									
				begin $display(" add result : %b\n", m32tbsc.result);                  end
			else if( m32tbsc.funct == 6'b100001)									
				begin $display(" addu result : %b\n", m32tbsc.result);                 end
			else if( m32tbsc.funct == 6'b100010)									
				begin $display(" sub result : %b\n", m32tbsc.result);                  end
			else if( m32tbsc.funct == 6'b100011)									
				begin $display(" subu result : %b\n", m32tbsc.result);                 end	
			else if( m32tbsc.funct == 6'b100100)									
				begin $display(" and result : %b\n", m32tbsc.result);                  end
			else if( m32tbsc.funct == 6'b100101)									
				begin $display(" or result : %b\n", m32tbsc.result);                   end
			else if( m32tbsc.funct == 6'b100111)									
				begin $display(" nor result : %b\n", m32tbsc.result);                  end
		   else if( m32tbsc.funct == 6'b101011)									
				begin $display(" sltu result : %b\n", m32tbsc.result);                 end
			
		end
	//I Type
	else if( m32tbsc.opcode == 6'b000100)									
		begin $display("beq result : %b , beq PC : %b\n", m32tbsc.aluResult, m32tbsc.PC);         end
	else if( m32tbsc.opcode == 6'b001001)									
		begin $display(" addiu result : %b\n", m32tbsc.result);                                   end
	else if( m32tbsc.opcode == 6'b001100)									
		begin $display(" andi result : %b aluResult : %b \n", m32tbsc.result, m32tbsc.aluResult); end
	else if( m32tbsc.opcode == 6'b001101)									
		begin $display(" ori result : %b\n", m32tbsc.result);                                     end
	else if( m32tbsc.opcode == 6'b100011)									
		begin $display(" lw data : %b address : %b \n", m32tbsc.readData, m32tbsc.aluResult);     end
	else if( m32tbsc.opcode == 6'b101011)									
		begin $display(" sw data : %b address : %b \n", m32tbsc.busB, m32tbsc.aluResult);         end
	
	//J Type 
	else if( m32tbsc.opcode == 6'b000010)									
		begin $display(" jump result : %b\n", m32tbsc.PC);                                        end
	
	// writing data to file 
	
	$writememb(".//data.mem", m32tbsc.dm.data_mem) ; 
	
	$writememb(".//registers.mem", m32tbsc.mr.registers) ; 
	
	end
	

endmodule


