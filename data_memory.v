module data_memory(read_data, mem_address, write_data, MemRead, MemWrite, clk);

	output [31:0] read_data;
	input [31:0] mem_address;
	input [31:0] write_data;
	input MemRead;
	input MemWrite;
	input clk;

	reg [31:0] data_mem [255:0];
	reg [31:0] read_data;

	always @ (MemRead) 
		begin // reading data from memory file
			if(MemRead == 1) 
			begin 
				read_data = data_mem[mem_address]; 
			end
		end
		
	always @ (posedge clk)
		begin
			if (MemWrite == 1) 		
			begin // writing data to memory file
				data_mem[mem_address] <= write_data;
				
			end
		end

endmodule
