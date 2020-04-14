`timescale 1ns / 1ps
// Megan and Ashlie, 2137, -02 -27 -2020

module add3_test();
	wire [3:0] out;
	reg [3:0] num;
	integer i;
	
	add3 add3_tester(.B (num), .Bo (out));
	
	initial  begin
		for (i=0; i<=4'hF; i=i+1) begin
			num = i;
			#10;
		end
		$finish;
	end
endmodule