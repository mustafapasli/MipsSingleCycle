`define DELAY 20
module alu_control_testbench(); 
reg [5:0]function_code;
reg [2:0]ALUOp;
wire [2:0]select_bits_ALU;
wire shift;
wire sltu;
alu_control actb (select_bits_ALU, shift, sltu, function_code, ALUOp);
//module alu_control(select_bits_ALU, shift, sltu, function_code, ALUOp);

initial begin

function_code = 6'b100000; ALUOp = 3'b111; // add
#`DELAY;
function_code = 6'b100001;	ALUOp = 3'b111; // addu
#`DELAY;
function_code = 6'b100100; ALUOp = 3'b111; // and
#`DELAY;
function_code = 6'b100111; ALUOp = 3'b111; // nor
#`DELAY;
function_code = 6'b100101; ALUOp = 3'b111; // or
#`DELAY;
function_code = 6'b101011; ALUOp = 3'b111; // sltu
#`DELAY;
function_code = 6'b000000; ALUOp = 3'b111; // sll
#`DELAY;
function_code = 6'b000010; ALUOp = 3'b111; // srl
#`DELAY;
function_code = 6'b100010; ALUOp = 3'b111; // sub
#`DELAY;
function_code = 6'b100011;	ALUOp = 3'b111; // subu
#`DELAY;
function_code = 6'b100000; ALUOp = 3'b000; 
#`DELAY;
function_code = 6'b100001;	ALUOp = 3'b001;
#`DELAY;
function_code = 6'b100100; ALUOp = 3'b010;
#`DELAY;
function_code = 6'b100111; ALUOp = 3'b011;
#`DELAY;
function_code = 6'b100101; ALUOp = 3'b100;
#`DELAY;
function_code = 6'b101011; ALUOp = 3'b101;
#`DELAY;
function_code = 6'b000000; ALUOp = 3'b110;
#`DELAY;

end

initial
begin
$monitor("time= %2d, function_code= %6b, select_bits_ALU= %3b, shift= %1b, sltu= %1b, ALUOp= %3b", $time,function_code ,select_bits_ALU, shift, sltu, ALUOp);
end

endmodule