`timescale 1ns / 1ps
//Megan Gordon
//ELC 2137  4-22-2020

module guessing_game(
    input btnU, btnD, btnR, btnL, 
    input clk,
    input [15:0] sw, 
    input btnC,
    output [3:0] seg,
    output [3:0] an,
    output [15:0] led);
    
    //counter
    wire [1:0] count1;
    counter #(.N(18))(.clk(clk), .rst(btnC), .en(sw[0]), .count(count1));
    
    //buttons U, D, R, and L debouced
    wire tickU;
    wire outU;
    debounce #(.N(2)) dbU (.clk(clk), .reset(btnC), .in(btnU), .out(outU),
        .tick(tickU));
        
    wire tickD;
    wire outD;
    debounce #(.N(2)) dbD (.clk(clk), .reset(btnC), .in(btnD), .out(outD),
        .tick(tickD));
        
    wire tickR;
    wire outR;
    debounce #(.N(2)) dbR (.clk(clk), .reset(btnC), .in(btnR), .out(outR),
        .tick(tickR));
        
    wire tickL;
    wire outL;
    debounce #(.N(2)) dbL (.clk(clk), .reset(btnC), .in(btnL), .out(outL),
        .tick(tickL));    
        
    //button debounce outputs to b input    
    wire [3:0] b;    
    assign tickU = b[3];
    assign tickD = b[2];
    assign tickR = b[1];
    assign tickL = b[0];
    
    wire win, lose;
    wire [3:0] y;
    guess_FSM #(.N(21)) guess (.clk(count1), .reset(btnC), .b(b), .y(y), .win(win), .lose(lose));
    
    //sseg4? How do I connect win/lose/y to get seg/an/led and connect to board???
    
endmodule
