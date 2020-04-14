`timescale 1ns / 1ps
// Ashlie Lackey and Megan Gordon, ELC 2137, 2020 -03 -05

module mux4 #(parameter N=4)(input [N-1:0] in3, 
                            input [N-1:0] in2, 
                            input [N-1:0] in1, 
                            input [N-1:0] in0,
                            input [1:0] sel,
                            output reg [N-1:0] out);
   always @(*)
   begin
    case(sel)
      0: out = in0;
      1: out = in1;
      2: out = in2;
      default: out = in3;
   endcase;
   end
endmodule
