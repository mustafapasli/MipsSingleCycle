module mips32_single_cycle(clk);

input clk;
wire [31:0] result;               
wire [31:0] instruction;

wire [5:0] funct;
wire [31:0] shamt;
wire [4:0] rd;
wire [4:0] rt;
wire [4:0] rs;
wire [5:0] opcode;
wire [4:0] rw;

wire [25:0] address;
wire [15:0] immediate;

wire [2:0] aluControl;

wire shift;
wire sltu;

wire [7:0] PC;

wire [31:0] busA;
wire [31:0] busB;

wire [31:0] muxbusA;
wire [31:0] muxbusB;

wire[31:0] ALUinputB;

wire [31:0] extendedImm;

wire  C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub;
wire regDst, ALUSrc, memtoReg, regWrite, memRead, memWrite, branch, jump;
wire [2:0] ALUOp;

wire [31:0] aluResult;
wire [31:0] sltuResult;
wire [31:0] readData; 
wire [31:0] writeDataRegister; 

//module instruction_memory(instruction, program_counter);
instruction_memory getInstr(instruction, PC);

// getting funct field from instruction
assign_6bit functAssign(funct, instruction[5:0]);

// getting shamt field from instruction and concatanate with 0
extend5to32 shamtExtend(shamt ,instruction[10:6]);

// getting rd field from instruction
assign_5bit rdAssign(rd, instruction[15:11]);

// getting rt field from instruction
assign_5bit rtAssign(rt, instruction[20:16]);

// getting rs field from instruction
assign_5bit rsAssign(rs, instruction[25:21]);

// getting opcode field from instruction
assign_6bit assignOpcode(opcode, instruction[31:26]);

// getting immediate field from instruction
assign_16bit immediateAssign(immediate, instruction[15:0]);

// getting address field from instruction
assign_26bit addressAssign(address, instruction[25:0]);

// immediate sign extending 16 bit to 32 bit 
sign_extend16to32 immExtending(extendedImm, immediate);

// gets opcode field and generates below signals 
// module mips_control_unit(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp, Opcode);
mips_control_unit generateSignal(regDst, ALUSrc, memtoReg, regWrite, memRead, memWrite, branch, jump, ALUOp, opcode);

// seletcts rt or rd field by regDst signal 
mux5bit_2to1 rTypeWrite(rw, regDst, rt, rd);

// gets below signals and ALUOp signals then generates ALU control signals 
// module alu_control(select_bits_ALU, shift, sltu, function_code, ALUOp);
alu_control generatingAluSig(aluControl, shift, sltu, funct, ALUOp);

// reads register file and returns rs,rt register context, if regWrite is 1 write_data to rw register
//module mips_registers
//( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );
// getting register contentn than writing content to register block by clock status
mips_registers mr (busA, busB, writeDataRegister, rs, rt, rw, regWrite, clk);

// shift muxes 
mux32bit_2to1 mux1(muxbusA, shift, busA, busB ); // changes busA with busB by shift signal, if shift is 0 selects busA 
mux32bit_2to1 mux2(muxbusB, shift, busB, shamt); // changes busB with shamt by shift signal, if shift is 0 selects busB 

// seletcs muxbusB or extendedImm by ALUSrc signal, if ALUSrc is 0 selects muxbusB 
mux32bit_2to1 muxALUSrc(ALUinputB, ALUSrc, muxbusB, extendedImm);

// takes alu control bits and 32 bit two inputs and returns calcating result and below signals  
// module alu32 
// (R, C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub, A, B, C_in , S0, S1, S2);
//  calculating the result by select bits
alu32 a32(aluResult, C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub, muxbusA, ALUinputB, 1'b0 , aluControl[0],aluControl[1], aluControl[2]);

// concataneting sltu bit with zero 
// first bit is carry out bit of substruction 
concanate1to32 sltuBit(sltuResult,C_out_sub);

// mux selects ALUresult or sltuResult by sltu signal
mux32bit_2to1 mux3(result, sltu, aluResult, sltuResult);

// gets aluResult for address and busB for data and returns and writes data by signals to mem file
// module data_memory(read_data, mem_address, write_data, MemRead, MemWrite, clk);
data_memory dm(readData, aluResult , busB, memRead, memWrite, clk);


// selects writing data by memtoReg signal
mux32bit_2to1 slcMemtoReg (writeDataRegister, memtoReg, aluResult, readData);

// generates next PC by below signals 
// module program_counter (PC,extend_immt_Value, Branch,zero, signalJump, jump_Address,clk );
program_counter genPC(PC, extendedImm, branch, Zero_bit, jump, address, clk);


endmodule