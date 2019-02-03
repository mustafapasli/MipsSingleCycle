module mips32(result, instruction);

output [31:0] result;

input [31:0] instruction;

wire [5:0] funct;
wire [31:0] shamt;
wire [4:0] rd;
wire [4:0] rt;
wire [4:0] rs;
wire [5:0] opcode;

wire [2:0] aluControl;
wire shift;
wire sltu;

wire [31:0] busA;
wire [31:0] busB;

wire [31:0] muxbusA;
wire [31:0] muxbusB;

wire  C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub;

wire [31:0] aluResult;
wire [31:0] sltuResult;

reg clk;

initial begin
	clk = 0;
end

always begin
	#50 clk = ~clk;
end
// getting funct field from instruction
or(funct[0], instruction[0], 1'b0);
or(funct[1], instruction[1], 1'b0);
or(funct[2], instruction[2], 1'b0);
or(funct[3], instruction[3], 1'b0);
or(funct[4], instruction[4], 1'b0);
or(funct[5], instruction[5], 1'b0);

// getting shamt field from instruction and concatanate with 0
or(shamt[0], instruction[6] , 1'b0);
or(shamt[1], instruction[7] , 1'b0);
or(shamt[2], instruction[8] , 1'b0);
or(shamt[3], instruction[9] , 1'b0);
or(shamt[4], instruction[10], 1'b0);
or(shamt[5],  1'b0 , 1'b0);
or(shamt[6],  1'b0 , 1'b0);
or(shamt[7],  1'b0 , 1'b0);
or(shamt[8],  1'b0 , 1'b0);
or(shamt[9],  1'b0 , 1'b0);
or(shamt[10], 1'b0 , 1'b0);
or(shamt[11], 1'b0 , 1'b0);
or(shamt[12], 1'b0 , 1'b0);
or(shamt[13], 1'b0 , 1'b0);
or(shamt[14], 1'b0 , 1'b0);
or(shamt[15], 1'b0 , 1'b0);
or(shamt[16], 1'b0 , 1'b0);
or(shamt[17], 1'b0 , 1'b0);
or(shamt[18], 1'b0 , 1'b0);
or(shamt[19], 1'b0 , 1'b0);
or(shamt[20], 1'b0 , 1'b0);
or(shamt[21], 1'b0 , 1'b0);
or(shamt[22], 1'b0 , 1'b0);
or(shamt[23], 1'b0 , 1'b0);
or(shamt[24], 1'b0 , 1'b0);
or(shamt[25], 1'b0 , 1'b0);
or(shamt[26], 1'b0 , 1'b0);
or(shamt[27], 1'b0 , 1'b0);
or(shamt[28], 1'b0 , 1'b0);
or(shamt[29], 1'b0 , 1'b0);
or(shamt[30], 1'b0 , 1'b0);
or(shamt[31], 1'b0 , 1'b0);

// getting rd field from instruction
or(rd[0], instruction[11] , 1'b0);
or(rd[1], instruction[12] , 1'b0);
or(rd[2], instruction[13] , 1'b0);
or(rd[3], instruction[14] , 1'b0);
or(rd[4], instruction[15] , 1'b0);

// getting rt field from instruction
or(rt[0], instruction[16] , 1'b0);
or(rt[1], instruction[17] , 1'b0);
or(rt[2], instruction[18] , 1'b0);
or(rt[3], instruction[19] , 1'b0);
or(rt[4], instruction[20] , 1'b0);

// getting rs field from instruction
or(rs[0], instruction[21] , 1'b0);
or(rs[1], instruction[22] , 1'b0);
or(rs[2], instruction[23] , 1'b0);
or(rs[3], instruction[24] , 1'b0);
or(rs[4], instruction[25] , 1'b0);

// getting opcode field from instruction
or(opcode[0], instruction[26], 1'b0);
or(opcode[1], instruction[27], 1'b0);
or(opcode[2], instruction[28], 1'b0);
or(opcode[3], instruction[29], 1'b0);
or(opcode[4], instruction[30], 1'b0);
or(opcode[5], instruction[31], 1'b0);

// generating ALU control signal 
control_unit cu(aluControl, shift, sltu, funct);

//module mips_registers
//( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );
// getting register contentn than writing content to register block by clock status
mips_registers mr (busA, busB, result, rs, rt, rd, 1'b1, clk);

// shift muxes 
mux32bit_2to1 mux1(muxbusA, shift, busA, busB ); // changes busA with busB by shift signal 
mux32bit_2to1 mux2(muxbusB, shift, busB, shamt); // changes busB with shamt by shift signal 

//module alu32 
//(R, C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub, A, B, C_in , S0, S1, S2);
// calculating the result by select bits
alu32 a32(aluResult, C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub, muxbusA, muxbusB, 1'b0 , aluControl[0],aluControl[1], aluControl[2]);


// concataneting sltu bit with zero 
// first bit is carry out bit of substruction 
or(sltuResult[0], C_out_sub, 1'b0);
or(sltuResult[1], 1'b0, 1'b0);
or(sltuResult[2], 1'b0, 1'b0);
or(sltuResult[3], 1'b0, 1'b0);
or(sltuResult[4], 1'b0, 1'b0);
or(sltuResult[5], 1'b0, 1'b0);
or(sltuResult[6], 1'b0, 1'b0);
or(sltuResult[7], 1'b0, 1'b0);
or(sltuResult[8], 1'b0, 1'b0);
or(sltuResult[9], 1'b0, 1'b0);
or(sltuResult[10], 1'b0, 1'b0);
or(sltuResult[11], 1'b0, 1'b0);
or(sltuResult[12], 1'b0, 1'b0);
or(sltuResult[13], 1'b0, 1'b0);
or(sltuResult[14], 1'b0, 1'b0);
or(sltuResult[15], 1'b0, 1'b0);
or(sltuResult[16], 1'b0, 1'b0);
or(sltuResult[17], 1'b0, 1'b0);
or(sltuResult[18], 1'b0, 1'b0);
or(sltuResult[19], 1'b0, 1'b0);
or(sltuResult[20], 1'b0, 1'b0);
or(sltuResult[21], 1'b0, 1'b0);
or(sltuResult[22], 1'b0, 1'b0);
or(sltuResult[23], 1'b0, 1'b0);
or(sltuResult[24], 1'b0, 1'b0);
or(sltuResult[25], 1'b0, 1'b0);
or(sltuResult[26], 1'b0, 1'b0);
or(sltuResult[27], 1'b0, 1'b0);
or(sltuResult[28], 1'b0, 1'b0);
or(sltuResult[29], 1'b0, 1'b0);
or(sltuResult[30], 1'b0, 1'b0);
or(sltuResult[31], 1'b0, 1'b0);

// mux selects ALUresult or sltuResult by sltu signal
mux32bit_2to1 mux3(result, sltu, aluResult, sltuResult);


//this module use just structural verilog
//Check page 17 from lecture6 slides

//Needs alu32 module(from hw2), mips_register module(completely finished from TA) and
//control unit part(you need to design) 

//mips32 has to work correctly for 10 instruction.
//alu32 design has to stay same(8:1 selection in order hw2)

//for srl instruction, you have to add 1 mux in sra module in alu32 
//(if selectbit==1(sra) use msb, if selectbit==0(srl) use 0)
//after this addition, if select bits == 101, alu32 can work both sra and srl.
//for this project sra not used. selection bit for adding mux is always 0.

//for srl,srl alu32 use A,B. 
//for srl,srl use rt and shamt. 
// A = $rt, B = shamt(need to extended with 0).
//for other instructions, 
// A = $rt, B = $rs 


endmodule