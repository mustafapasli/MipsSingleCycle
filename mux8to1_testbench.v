`define DELAY 20
module mux8to1_testbench(); 
reg S0, S1, S2, B0, B1, B2, B3, B4, B5, B6, B7;
wire O;

mux8to1 m81tb (O, S0, S1, S2, B0, B1, B2, B3, B4, B5, B6, B7);

initial begin

B7= 1'b1; B6 = 1'b0; B5 = 1'b1; B4 = 1'b0; B3= 1'b1; B2 = 1'b0; B1 = 1'b1; B0 = 1'b0;

S2 = 1'b0; S1 = 1'b0; S0 = 1'b0;
#`DELAY;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b0;
#`DELAY;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b0;
#`DELAY;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b0;
#`DELAY;
S2 = 1'b0; S1 = 1'b0; S0 = 1'b1;
#`DELAY;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b1;
#`DELAY;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b1;
#`DELAY;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b1;
#`DELAY;

B7= 1'b1; B6 = 1'b0; B5 = 1'b0; B4 = 1'b1; B3= 1'b1; B2 = 1'b0; B1 = 1'b0; B0 = 1'b1;

S2 = 1'b0; S1 = 1'b0; S0 = 1'b0;
#`DELAY;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b0;
#`DELAY;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b0;
#`DELAY;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b0;
#`DELAY;
S2 = 1'b0; S1 = 1'b0; S0 = 1'b1;
#`DELAY;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b1;
#`DELAY;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b1;
#`DELAY;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b1;
#`DELAY;



end

initial
begin
$monitor("time = %2d, S2 = %1b, S1 = %1b, S0 = %1b, B7 = %1b, B6 = %1b,  B5 = %1b, B4 = %1b, B3 = %1b, B2 = %1b,  B1 = %1b, B0 = %1b, O = %1b", $time,S2, S1,S0,B7,B6,B5,B4, B3, B2, B1, B0, O);
end

endmodule
