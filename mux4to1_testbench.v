`define DELAY 20
module mux4to1_testbench(); 
reg S0, S1, B0, B1, B2, B3;
wire O;

mux4to1 m41tb (O, S0, S1, B0, B1, B2, B3);

initial begin

B3= 1'b1; B2 = 1'b0; B1 = 1'b1; B0 = 1'b0;

S1 = 1'b0; S0 = 1'b0;
#`DELAY;
S1 = 1'b1; S0 = 1'b0;
#`DELAY;
S1 = 1'b0; S0 = 1'b1;
#`DELAY;
S1 = 1'b1; S0 = 1'b1;
#`DELAY;

B3= 1'b1; B2 = 1'b0; B1 = 1'b0; B0 = 1'b1;

S1 = 1'b0; S0 = 1'b0;
#`DELAY;
S1 = 1'b1; S0 = 1'b0;
#`DELAY;
S1 = 1'b0; S0 = 1'b1;
#`DELAY;
S1 = 1'b1; S0 = 1'b1;
#`DELAY;
end

initial
begin
$monitor("time = %2d, S1 = %1b, S0 = %1b, B3 = %1b, B2 = %1b,  B1 = %1b, B0 = %1b, O = %1b", $time, S1,S0, B3, B2, B1, B0, O);
end

endmodule