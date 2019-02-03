module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);

	output [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	reg [31:0] registers [31:0];

	
	assign read_data_1 = registers[read_reg_1]; // bus A
	
	assign read_data_2 = registers[read_reg_2]; // bus B 

	always @ (negedge clk) begin			
		if (signal_reg_write && write_reg > 1'd0) // if register  is not zero register, writes 
		
		begin
		  
		  registers[write_reg] <= write_data;  // write content 
		  
		  
		end
	end 	 
	
endmodule   