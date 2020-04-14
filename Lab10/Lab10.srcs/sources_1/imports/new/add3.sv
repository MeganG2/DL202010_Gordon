`timescale 1ns / 1ps
// Megan and Ashlie, 2137, -02 -27 -2020

module add3(
    input [3:0] B,
    output reg [3:0] Bo
    );
    
    always @*
        if (B > 4'd4)
            Bo = B + 4'd3;
        else
            Bo = B;
    
endmodule