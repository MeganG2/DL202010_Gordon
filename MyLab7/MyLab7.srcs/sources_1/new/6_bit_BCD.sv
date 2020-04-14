`timescale 1ns / 1ps
// Megan and Ashlie, 2137, -02 -27 -2020


module bit6_BCD(
    input [5:0] Bin,
    output reg [7:0] Bout
    );
    wire [2:0] c12;
    wire [2:0] c23;

    add3 c1(.B({0, Bin[5:3]}), .Bo({Bout[6], c12}));
    
    add3 c2(.B({c12, Bin[2]}), .Bo({Bout[5],c23}));
    
    add3 c3(.B({c23, Bin[1]}), .Bo(Bout[4:1]));
 
 assign Bout[7] = 0;
 assign Bout[0] = Bin[0];
endmodule