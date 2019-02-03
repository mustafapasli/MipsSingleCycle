`define DELAY 20

module data_memory_testbench();

reg [31:0]mem_address;
reg [31:0]write_data;
reg MemRead, MemWrite, clk;

wire [31:0]read_data;

initial begin
	clk = 0;
end

always begin
	#20 clk = ~clk;
end

data_memory dmtb(read_data, mem_address, write_data, MemRead, MemWrite, clk);

//module data_memory(read_data, mem_address, write_data, MemRead, MemWrite, clk);

initial
begin

mem_address = 32'b00000000000000000000000000000100; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b1; MemWrite = 1'b0;
#`DELAY ;
mem_address = 32'b00000000000000000000000000000001; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b1; MemWrite = 1'b1; 
#`DELAY ;
mem_address = 32'b00000000000000000000000000000010; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b0; MemWrite = 1'b0; 
#`DELAY ;
mem_address = 32'b00000000000000000000000000000011; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b0; MemWrite = 1'b1; 
#`DELAY ;
mem_address = 32'b00000000000000000000000000000101; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b1; MemWrite = 1'b0;
#`DELAY ;
mem_address = 32'b00000000000000000000000000000001; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b1; MemWrite = 1'b1; 
#`DELAY ;
mem_address = 32'b00000000000000000000000000000010; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b0; MemWrite = 1'b0; 
#`DELAY ;
mem_address = 32'b00000000000000000000000000000011; write_data = 32'b11100000000000000000000000000000; MemRead = 1'b0; MemWrite = 1'b1; 
#`DELAY ;
end 

initial
begin
$monitor("time = %2d, read_data= %32b ,mem_address= %32b, write_data= %32b, MemRead= %1b, MemWrite= %1b, clk= %1b", $time, read_data, mem_address, write_data, MemRead, MemWrite, clk);
end
 
endmodule