`define DELAY 100
module program_counter_testbench();


reg [31:0] extend_immt_Value;
reg Branch, zero, signalJump;
reg [25:0] jump_Address;
reg clk;

wire [7:0] PC ;	



always begin
	#50 clk = ~clk;
end
  	
program_counter pctb (PC,extend_immt_Value, Branch,zero, signalJump, jump_Address,clk );

//module program_counter (PC,extend_immt_Value, Branch,zero, signalJump, jump_Address,clk );	
initial begin

	pctb.programcounter = 8'b00000000;
	clk = 0;
	
end

initial
begin

extend_immt_Value = 32'b00000000000000000000000000100000; 
Branch = 1'b1; zero = 1'b1; signalJump = 1'b0; 
jump_Address = 26'b00000000000000000000010101;
#`DELAY ;

end 

initial
begin
$monitor("time = %2d,PC= %8b extend_immt_Value= %32b ,branch = %1b, zero= %1b, signalJump= %1b, jump_Address= %25b, clk= %1b", $time, PC,extend_immt_Value, Branch,zero, signalJump, jump_Address,clk);
end

endmodule