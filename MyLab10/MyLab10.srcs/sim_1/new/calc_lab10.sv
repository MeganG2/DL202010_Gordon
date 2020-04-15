`timescale 1ns / 1ps
//Megan Gordon, ELC 2137, 2020-04-09

module calc_lab10(
    input btnU,
    input btnD,
    input [15:0]sw,
    input clk,
    input btnC,
    output [15:0]led,
    output [6:0] seg,
    output dp,
    output [3:0] an);

sseg4_TDM disp_unit(.data({8'b00000000, led[15:8]}), 
                .hex_dec(sw[15]), .sign(sw[14]), .clk(clk), .rst(btnC), 
                .seg(seg), .dp(dp), .an(an));
                              
top_lab9 calc_unit(.btnC(btnC), .btnD(btnD), .btnU(btnU), .clk(clk),
                .sw(sw), .led(led));

endmodule
