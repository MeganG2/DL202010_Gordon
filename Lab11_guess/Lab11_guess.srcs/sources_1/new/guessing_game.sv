`timescale 1ns / 1ps
//Megan Gordon
//ELC 2137  4-22-2020

module guessing_game(
    input btnU, btnD, btnR, btnL, 
    input clk,
    input [15:0] sw, 
    input btnC,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led,
    output clock);
    
    //counter
    wire [1:0] count1;
    counter #(.N(2))(.clk(clk), .rst(btnC), .en(sw[0]), .count(count1));
    
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
    assign outU = b[3];
    assign outR = b[2];
    assign outD = b[1];
    assign outL = b[0];
    
    mux2_4b  mux1(.in0(clk) , .in1(count1) , .sel(sw[15]) ,.out(clock));
    
    wire win, lose;
    wire [3:0] y;
    guess_FSM #(.N(21)) guess (.clk(clock), .reset(btnC), .b(b), .y(y), .win(win), .lose(lose));
    
    
    
    //assign an[1] = ~sw[15];
    assign an[0] = 0;
    assign an[3:1] = 3'b111;
    
    always @*
    begin
    if (y==4'b0001)
        seg = 7'b1111110; //top
        
    else if (y==4'b0010)
        seg = 7'b1111001; //right
        
    else if (y == 4'b0100) 
        seg = 7'b1110111; //bottom
        
    else if (y==4'b100)
        seg = 7'b1001111; //left
    end 
    
    always @*
    begin
    if (win)
        led=16'b1111111111111111;
    else if (lose)
        led=16'b0000001110000000;
        end
endmodule
