`define DELAY 20
module sign_extend16to32_testbench();

reg [15:0] A;
wire [31:0] R;

//module sign_extend16to32(bit_32 ,bit_16);
sign_extend16to32 se16to32tb (R, A);

initial begin

A = 16'b0000101011000001 ;
#`DELAY ;
A = 16'b1110101010000001 ; 
#`DELAY ;
A = 16'b0100000000000000 ; 
#`DELAY ;
A = 16'b1100000000000000 ; 
#`DELAY ;

end

initial begin

$monitor("time = %2d, A = %16b, R = %32b",$time, A, R);

end

endmodule 