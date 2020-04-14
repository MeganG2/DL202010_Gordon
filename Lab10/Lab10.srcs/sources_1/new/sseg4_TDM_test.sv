`timescale 1ns / 1ps
//Megan Gordon, ELC 2137, 2020-04-09

module sseg4_TDM_test();
    reg [15:0] data;
    reg hex_dec,sign;
    wire [7:0] seg;
    wire dp;
    wire [3:0] an;
    reg rst, clk, en;

 sseg4_TDM(.clk(clk), .en(en), .rst(rst), .data(data));

endmodule
