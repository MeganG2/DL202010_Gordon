`timescale 1ns / 1ps
// Megan and Ashlie, 2137, -02 -27 -2020
module bcd11_test();
	wire [3:0] onest, tenst, hundredst, thousandst;
	reg [10:0] num;
	integer i;
	
	bcd11 tester(.B(num), .ones(onest), .tens(tenst), .hundreds(hundredst), .thousands(thousandst));
	
	initial  begin
		for (i=0; i<=11'b11111111111; i=i+1) begin
			num = i;
			#10;
		end
		$finish;
	end
endmodule