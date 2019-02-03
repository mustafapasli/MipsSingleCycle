module mips_registers_testbench(); 
	
	reg [4:0] addressRs, addressRt, addressRd ;
	reg [31:0] writeData;
	reg signal_reg_write;
	wire [31:0] Rs, Rt;
	reg clk;
	reg [1:0]counter;
	
	mips_registers deneme( Rs, Rt, writeData,addressRs, addressRt, addressRd, signal_reg_write, clk);
	//mips_registers ( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk )
	
	initial begin
		clk = 0;
		signal_reg_write = 1;
		counter = 0;
	end
	
	always begin
		#10 clk = ~clk;
	end

	initial begin
		
		writeData = 32'b10101010101010101010101010101010;											
		addressRs = 5'b00000 ;addressRt = 5'b00001 ;addressRd = 5'b00010 ;		
		counter <= counter + 1;#20;
		
		writeData = 32'b01010101010101010101010101010101;
		addressRs = 5'b00010 ;addressRt = 5'b00100 ;addressRd = 5'b00101 ; 				
		counter <= counter + 1; 
	
	end
	 
	always @(posedge clk)
	begin
		$monitor("pos: time = %3d, addressRs = %5b, addressRt = %5b, addressRd = %5b, clk = %1b, $Rs = %32b, $Rt = %32b", 
					 $time, addressRs, addressRt, addressRd , clk, Rs, Rt);
		
	end
	 
	always @(negedge clk)
	begin
		$monitor("neg: time = %3d, addressRs = %5b, addressRt = %5b, addressRd = %5b, clk = %1b, $Rs = %32b, $Rt = %32b", 
					 $time, addressRs, addressRt, addressRd , clk, Rs, Rt);
					 
		if(counter === 2'd2)
			begin
				$finish;
			end
		
	end
	
	
 
endmodule