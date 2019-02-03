`define DELAY 20
module mux32bit_2to1_testbench(); 
reg [31:0] A;
reg [31:0] B;
reg S;
wire [31:0] O;
mux32bit_2to1 m32tb (O, S, A, B);
// module mux32Bit_2to1 (O, S, A, B);

initial begin

A = 31'b00100000001000000010000000111111; // 
B = 31'b00100000001000000010000000100001;	//

S = 1'b0;
#`DELAY;
S = 1'b1;
#`DELAY;

end

initial
begin
$monitor("time = %2d, A = %32b, B = %32b, S = %1b, O = %32b ", $time, A, B, S ,O);
end

endmodule