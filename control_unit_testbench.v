`define DELAY 20
module control_unit_testbench(); 
reg [5:0]function_code;
wire [2:0]select_bits_ALU;
wire shift;
wire sltu;
control_unit cutb (select_bits_ALU, shift, sltu, function_code);
// module control_unit(select_bits_ALU, shift, sltu, function_code);

initial begin

function_code = 6'b100000; // add
#`DELAY;
function_code = 6'b100001;	// addu
#`DELAY;
function_code = 6'b100100; // and
#`DELAY;
function_code = 6'b100111; // nor
#`DELAY;
function_code = 6'b100101; // or
#`DELAY;
function_code = 6'b101011; // sltu
#`DELAY;
function_code = 6'b000000; // sll
#`DELAY;
function_code = 6'b000010; // srl
#`DELAY;
function_code = 6'b100010; // sub
#`DELAY;
function_code = 6'b100011;	// subu
#`DELAY;

end

initial
begin
$monitor("time = %2d, function_code = %6b, select_bits_ALU = %3b, shift = %1b, sltu = %1b ", $time,function_code ,select_bits_ALU, shift, sltu);
end

endmodule