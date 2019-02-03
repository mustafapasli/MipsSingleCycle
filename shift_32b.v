module shift_32b(O, A, B, D); //  D> direction, F> false=0

	input D; 
	
	input [31:0] A, B;

	output [31:0] O;

	wire [31:0] shifter0_result;
	wire [31:0] shifter1_result;
	wire [31:0] shifter2_result;
	wire [31:0] shifter3_result;
	wire [31:0] shifter4_result;
	wire [31:0] shifter5_result;
	wire [31:0] shifter6_result;
	wire [31:0] shifter7_result;
	wire [31:0] shifter8_result;
	wire [31:0] shifter9_result;
	wire [31:0] shifter10_result;
	wire [31:0] shifter11_result;
	wire [31:0] shifter12_result;
	wire [31:0] shifter13_result;
	wire [31:0] shifter14_result;
	wire [31:0] shifter15_result;
	wire [31:0] shifter16_result;
	wire [31:0] shifter17_result;
	wire [31:0] shifter18_result;
	wire [31:0] shifter19_result;
	wire [31:0] shifter20_result;
	wire [31:0] shifter21_result;
	wire [31:0] shifter22_result;
	wire [31:0] shifter23_result;
	wire [31:0] shifter24_result;
	wire [31:0] shifter25_result;
	wire [31:0] shifter26_result;
	wire [31:0] shifter27_result;
	wire [31:0] shifter28_result;
	wire [31:0] shifter29_result;
	wire [31:0] shifter30_result;
	wire [31:0] shifter31_result;

	wire [30:0] enableand;

	wire nor27bit;
 
	wire notbit0 ,notbit1, notbit2, notbit3, notbit4;


	not (notbit0, B[0]);
	not (notbit1, B[1]);
	not (notbit2, B[2]);
	not (notbit3, B[3]);
	not (notbit4, B[4]);

	nor(nor27bit, B[5], B[6], B[7], B[8], B[9], B[10],
					B[11], B[12], B[13], B[14], B[15], B[16],
					B[17], B[18], B[19], B[20], B[21], B[22],
					B[23], B[24], B[25], B[26], B[27], B[28],
					B[29], B[30], B[31]
		);

	and (enableand[0], notbit0, nor27bit);
	and (enableand[1], notbit1, nor27bit);
	and (enableand[2], notbit2, nor27bit);
	and (enableand[3], notbit3, nor27bit);
	and (enableand[4], notbit4, nor27bit);

	shift_1b shifter1  (shifter0_result,  A,                enableand[0], D);
	shift_1b shifter2  (shifter1_result,  shifter0_result,  enableand[1], D);
	shift_1b shifter3  (shifter2_result,  shifter1_result,  enableand[1], D);
	shift_1b shifter4  (shifter3_result,  shifter2_result,  enableand[2], D);
	shift_1b shifter5  (shifter4_result,  shifter3_result,  enableand[2], D);
	shift_1b shifter6  (shifter5_result,  shifter4_result,  enableand[2], D);
	shift_1b shifter7  (shifter6_result,  shifter5_result,  enableand[2], D);
	shift_1b shifter8  (shifter7_result,  shifter6_result,  enableand[3], D);
	shift_1b shifter9  (shifter8_result,  shifter7_result,  enableand[3], D);
	shift_1b shifter10 (shifter9_result,  shifter8_result,  enableand[3], D);
	shift_1b shifter11 (shifter10_result, shifter9_result,  enableand[3], D);
	shift_1b shifter12 (shifter11_result, shifter10_result, enableand[3], D);
	shift_1b shifter13 (shifter12_result, shifter11_result, enableand[3], D);
	shift_1b shifter14 (shifter13_result, shifter12_result, enableand[3], D);
	shift_1b shifter15 (shifter14_result, shifter13_result, enableand[3], D);
	shift_1b shifter16 (shifter15_result, shifter14_result, enableand[4], D);
	shift_1b shifter17 (shifter16_result, shifter15_result, enableand[4], D);
	shift_1b shifter18 (shifter17_result, shifter16_result, enableand[4], D);
	shift_1b shifter19 (shifter18_result, shifter17_result, enableand[4], D);
	shift_1b shifter20 (shifter19_result, shifter18_result, enableand[4], D);
	shift_1b shifter21 (shifter20_result, shifter19_result, enableand[4], D);
	shift_1b shifter22 (shifter21_result, shifter20_result, enableand[4], D);
	shift_1b shifter23 (shifter22_result, shifter21_result, enableand[4], D);
	shift_1b shifter24 (shifter23_result, shifter22_result, enableand[4], D);
	shift_1b shifter25 (shifter24_result, shifter23_result, enableand[4], D);
	shift_1b shifter26 (shifter25_result, shifter24_result, enableand[4], D);
	shift_1b shifter27 (shifter26_result, shifter25_result, enableand[4], D);
	shift_1b shifter28 (shifter27_result, shifter26_result, enableand[4], D);
	shift_1b shifter29 (shifter28_result, shifter27_result, enableand[4], D);
	shift_1b shifter30 (shifter29_result, shifter28_result, enableand[4], D);
	shift_1b shifter31 (shifter30_result, shifter29_result, enableand[4], D);
	shift_1b shifter32 (O,                    shifter30_result, nor27bit, D);


endmodule















































