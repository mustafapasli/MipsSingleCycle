module control_unit(select_bits_ALU, shift, sltu, function_code);

input [5:0] function_code;
output [2:0] select_bits_ALU;
output shift;
output sltu;

wire f0andf2;
wire f5not;
wire f1andf5not;
wire f1andf2;
wire f1not;
wire f2not;
wire f1notandf2not;
wire f4not;
wire f0not;
wire f3not;


// s0 bit
and(f0andf2, function_code[0],function_code[2]);
not(f5not, function_code[5]);
and(f1andf5not, function_code[1], f5not);
or(select_bits_ALU[0], f0andf2, f1andf5not);

// s1 bit

and(f1andf2, function_code[1],function_code[2]);
not(f1not, function_code[1]);
not(f2not, function_code[2]);
and(f1notandf2not,f1not,f2not);
or(select_bits_ALU[1], f1andf2, f1notandf2not);

// s2 bit

or(select_bits_ALU[2], f5not, function_code[1]);

// sltu signal 

not(f4not, function_code[4]);
and(sltu, function_code[0], function_code[1],f2not,function_code[3],f4not, function_code[5]);

// shift signal 

not(f3not,function_code[3]);
not(f0not,function_code[0]);
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