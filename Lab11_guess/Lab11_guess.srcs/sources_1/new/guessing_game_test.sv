`timescale 1ns / 1ps
//Megan Gordon
//ELC 2137  5-1-2020

module guessing_game_test();
    reg btnU, btnD, btnR, btnL;
    reg clk;
    reg [15:0] sw; 
    reg btnC;
    wire [6:0] seg;
    wire [3:0] an;
    wire [15:0] led;

    guessing_game guess2(.clk(clk), .btnU(btnU), .btnD(btnD),.btnR(btnR),
             .btnL(btnL), .sw(sw), .seg(seg), .an(an), .led(led));
        
    always begin
        #1 clk = ~clk;
    end
    
    initial begin
        clk=0; btnU=0; btnD=0; btnR=0; btnL=0; btnC=0; #5;
        btnC=1; #5;
        btnC=0; #10;
        btnU=1; #20;
        btnU=0;
        btnR=1; #20;
        btnR=0;
       // b=4'b0000; #20;
       // b=4'b1000; #20;
        $finish;
    end
endmodule // guessing_game_test