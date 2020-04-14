`timescale 1ns / 1ps
// Ashlie Lackey and Megan Gordon, ELC 2137, 2020 -03 -05

module an_decode(input [1:0] in,
                 output reg [3:0] out);
                 
              always @*
                 begin
                    case(in)
                         0: out = 4'b1110;
                         1: out = 4'b1101;
                         2: out = 4'b1011;
                         default: out = 4'b0111;
                    endcase
                 end
endmodule
