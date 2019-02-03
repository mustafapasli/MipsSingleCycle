module instruction_memory(instruction, program_counter);
input [7:0] program_counter;
output [31:0] instruction;

reg [31:0]instr_mem[255:0];

assign instruction = instr_mem[program_counter]; // getting instruction by PC

endmodule
