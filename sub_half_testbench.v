`define DELAY 20
module sub_half_testbench(); 
reg a, b;
wire sub, carry_out;

sub_half shtb (sub, carry_out, a, b);

initial begin
a = 1'b0; b = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b1;
#`DELAY;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, sub=%1b, carry_out=%1b", $time, a, b, sub, carry_out);
end
 
endmodule