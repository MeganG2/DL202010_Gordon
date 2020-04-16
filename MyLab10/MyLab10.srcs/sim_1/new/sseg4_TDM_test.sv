`timescale 1ns / 1ps
//Megan Gordon, ELC 2137, 2020-04-09

module sseg4_TDM_test();


reg [15:0] data;
reg hex_dec,sign;
wire [6:0] seg;
wire dp;
wire [3:0] an;
reg rst, clk;


sseg4_TDM testTDM(.clk(clk), .rst(rst), .data(data), .seg(seg), .dp(dp), .an(an),
                    .hex_dec(hex_dec), .sign(sign));
   
    always begin 
        clk = ~clk; #10;
    end //clock constantly runs
        
    initial begin
        clk=0; rst=1;
        hex_dec=0; sign=0;
        data=16'b0001011001110011;
       #2621440;
       rst=0; #26214400;
       hex_dec=1; #26214400;
       sign=1; 
       end
        
endmodule