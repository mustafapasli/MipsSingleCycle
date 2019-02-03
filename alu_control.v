module alu_control(select_bits_ALU, shift, sltu, function_code, ALUOp);

input [5:0] function_code;
input [0:2] ALUOp;
output [2:0] select_bits_ALU;
output shift;
output sltu;

wire f0not;
wire f1not;
wire f2not;
wire f3not;
wire f4not;
wire f5not;

wire ALUOp2not;
wire ALUOp1not;
wire ALUOp0not;

not(f0not,function_code[0]);
not(f1not, function_code[1]);
not(f2not, function_code[2]);
not(f3not,function_code[3]);
not(f4not, function_code[4]);
not(f5not, function_code[5]);

not(ALUOp2not, ALUOp[2]);
not(ALUOp1not, ALUOp[1]);
not(ALUOp0not, ALUOp[0]);

// --------------------- s2 bit ----------------------- //

wire ALUOp0andALUOp1not;
wire ALUOp0andALUOp2not;
wire ALUOp0andf5not;
wire ALUOp0andfunct1;

and(ALUOp0andALUOp1not, ALUOp[0], ALUOp1not);
and(ALUOp0andALUOp2not, ALUOp[0], ALUOp2not);
and(ALUOp0andf5not, ALUOp[0], f5not);
and(ALUOp0andfunct1, ALUOp[0], function_code[1]);

or(select_bits_ALU[2],ALUOp0andALUOp1not, ALUOp0andALUOp2not, ALUOp0andf5not, ALUOp0andfunct1);

// --------------------- s1 bit ----------------------- //

wire ALUOp0notandALUOp1;
wire ALUOp1andALUOp2not;
wire ALUOp1andf2notandf1not;
wire ALUOp1andfunct2andfunct1;

and(ALUOp0notandALUOp1, ALUOp0not, ALUOp[1]);
and(ALUOp1andALUOp2not, ALUOp[1], ALUOp2not); 
and(ALUOp1andf2notandf1not, ALUOp[1], f2not, f1not); 
and(ALUOp1andfunct2andfunct1, ALUOp[1], function_code[2], function_code[1]);

or(select_bits_ALU[1], ALUOp0notandALUOp1, ALUOp1andALUOp2not, ALUOp1andf2notandf1not, ALUOp1andfunct2andfunct1);

// --------------------- s0 bit ----------------------- //

wire ALUOp0notandALUOp2;
wire ALUOp1notandALUOp2;
wire ALUOp2andf5notandfunct1;
wire ALUOp2andfunct2andfunct0;

and(ALUOp0notandALUOp2, ALUOp0not, ALUOp[2]);
and(ALUOp1notandALUOp2,	ALUOp1not, ALUOp[2]);	
and(ALUOp2andf5notandfunct1, ALUOp[2], f5not, function_code[1]);
and(ALUOp2andfunct2andfunct0, ALUOp[2] ,function_code[2], function_code[0]);

or(select_bits_ALU[0], ALUOp0notandALUOp2,ALUOp1notandALUOp2, ALUOp2andf5notandfunct1, ALUOp2andfunct2andfunct0);


// sltu signal 


and(sltu, function_code[0], function_code[1],f2not,function_code[3],f4not, function_code[5]);

// shift signal 


and(shift, f0not, f2not, f3not, f4not, f5not);

//this module use just structural verilog
//contol unit part = convert to function code(6bits) to select bits(3bits)(needs ALU)
//for control unit part, have to design circuit that can only do this job. 
//(Remember the lecture,first step use K-map.......)

//example
//input = function_code = 20(hex) = 32(dec) = add
//output = select_bits_ALU = 010(binary) = 2(dec) = add

//function_code = 02(srl) -> select bits == 101 (alu32 can work srl)


endmodule