module sseg1_BCD(
		input [15:0]sw,
		output [3:0]an,
		output [6:0]seg,
		output dp
	);
	wire [3:0] uno;
	wire [3:0] diez;
	wire [3:0] cien;
	wire [3:0] mil;
	wire [3:0] keith;
	assign an[1] = ~sw[15];
	assign an[0] = sw[15];
	assign an[3:2] = 2'b11;
	assign dp = 1;
	
	bcd11 terry(.B(sw[10:0]), .ones(uno), .tens(diez), .hundreds(cien), .thousands(mil));
	mux2_4b william (.in1(diez), .in0(uno), .sel(sw[15]), .out(keith));
	sseg_decoder robert(.num(keith), .sseg(seg));
endmodule