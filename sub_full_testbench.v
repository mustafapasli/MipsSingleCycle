`define DELAY 20
module sub_full_testbench(); 
reg a, b, carry_in;
wire sub, carry_out;

sub_full aftb (sub, carry_out, a, b, carry_in);

initial begin
a = 1'b0; b = 1'b0; carry_in = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b0; carry_in = 1'b1;
#`DELAY;
a = 1'b0; b = 1'b1; carry_in = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b1; carry_in = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b0; carry_in = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b0; carry_in = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b1; carry_in = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b1; carry_in = 1'b1;
#`DELAY;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, carry_in=%1b, sub=%1b, carry_out=%1b", $time, a, b, carry_in, sub, carry_out);
end
 
endmodule