`define DELAY 20
module shift_1b_testbench();

reg E, D; 
reg [31:0] B;

wire [31:0] O;

shift_1b s1btb (O, B, E, D); // E> eneble , D> direction, F> false=0

initial begin

B = 32'b10000000000000100000000000000001;

E = 1'b0; D = 1'b0;
#`DELAY;
E = 1'b0; D = 1'b1;
#`DELAY;
E = 1'b1; D = 1'b0;
#`DELAY;
E = 1'b1; D = 1'b1;
#`DELAY;

end

initial begin

$monitor("time = %2d, B = %32b, E = %1b, D = %1b, O = %32b ",$time, B, E, D, O);

end

endmodule