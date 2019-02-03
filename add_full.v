module add_full(S, C_out, A, B, C_in);
	input A,B,C_in;
	output S,C_out;
	wire temp_S, first_C_out, second_C_out;

	add_half first_S(temp_S, first_C_out, A, B);
	add_half second_S(S, second_C_out, temp_S, C_in);

	or final_C_out(C_out, second_C_out, first_C_out);

endmodule