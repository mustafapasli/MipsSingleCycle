`define DELAY 20
module alu32_testbench();

reg [31:0] A;
reg [31:0] B;

reg S2, S1, S0;
reg C_in;

wire [31:0] R;
wire C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub;

alu32 alutb (.R(R), .C_out_sum(C_out_sum), .C_out_sub(C_out_sub), .Zero_bit(Zero_bit), .V_sum(V_sum), .V_sub(V_sub), .A(A), .B(B), .C_in(C_in) , .S0(S0), .S1(S1), .S2(S2));
//module alu32 (R, C_out_sum, C_out_sub, Zero_bit, V_sum, V_sub, A, B, C_in , S0, S1, S2);
	initial begin

		//------------------------------------------------------//

		A = 32'b00000000000000000000000000000011;  
		B = 32'b00000000000000000000000000000011;

		C_in = 1'b0;

		S2 = 1'b1;
		S1 = 1'b0;
		S0 = 1'b0;


end 

initial begin
$monitor("A= %32b, B= %32b, R= %32b, S2 = %1b, S1 = %1b, S0 = %1b, Zero_bit = %1b, C_in = %1b, C_out_sum = %1b, C_out_sub = %1b, V_sum = %1b, V_sub = %1b  ", A, B, R, S2, S1, S0, Zero_bit,  C_in, C_out_sum, C_out_sum, V_sum, V_sub,);
end

endmodule