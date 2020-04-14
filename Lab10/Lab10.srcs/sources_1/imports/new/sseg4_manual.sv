`timescale 1ns / 1ps
// Ashlie Lackey and Megan Gordon, ELC 2137, 2020 -03 -05

module sseg4_manual(input [15:0]sw,
                    output [6:0] seg,
                    output dp,
                    output [3:0] an);
                    
      sseg4 boardconnect(.data({4'b0000, sw[11:0]}), .hex_dec(sw[15]), .sign(sw[14]), .digit_sel(sw[13:12]), .seg(seg), .dp(dp), .an(an));              
endmodule
