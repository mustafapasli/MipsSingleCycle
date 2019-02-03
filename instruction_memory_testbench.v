`define DELAY 20
module instruction_memory_testbench();

reg [31:0] program_counter;
wire [31:0] instruction;

instruction_memory imtb(instruction, program_counter);

initial
begin

program_counter = 32'b00000000000000000000000000000000;
#`DELAY ;
program_counter = 32'b00000000000000000000000000000001;
#`DELAY ;
program_counter = 32'b00000000000000000000000000000010;
#`DELAY ;
program_counter = 32'b00000000000000000000000000000011; 
#`DELAY ;
program_counter = 32'b00000000000000000000000000000100; 
#`DELAY ;
program_counter = 32'b00000000000000000000000000000101;
#`DELAY ;
program_counter = 32'b00000000000000000000000000000110; 
#`DELAY ;
program_counter = 32'b00000000000000000000000000000111; 
#`DELAY ;

end 

initial
begin
$monitor("time = %2d, instruction= %32b, pc= %32b ", $time, instruction, program_counter);
end
 
endmodule