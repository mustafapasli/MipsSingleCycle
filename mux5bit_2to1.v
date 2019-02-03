module mux5bit_2to1 (O, S, A, B);

input [4:0] A;
input [4:0] B;
input S;
output [4:0] O;

mux2to1 mux1 (O[0] , S, A[0] , B[0] );
mux2to1 mux2 (O[1] , S, A[1] , B[1] );
mux2to1 mux3 (O[2] , S, A[2] , B[2] );
mux2to1 mux4 (O[3] , S, A[3] , B[3] );
mux2to1 mux5 (O[4] , S, A[4] , B[4] );

endmodule  