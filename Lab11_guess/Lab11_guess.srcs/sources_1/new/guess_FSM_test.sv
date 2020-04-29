`timescale 1ns / 1ps
//Megan Gordon
//ELC 2137  4-22-2020

module guess_FSM_test();

    reg clk, reset;
    wire [3:0] y;
    reg [3:0] b;
    wire win, lose;
    
    guess_FSM #(.N(21))guess1(.clk(clk), .reset(reset), .b(b), .y(y), .win(win), .lose(lose));
        
    always begin
        #1 clk = ~clk;
    end
    
    initial begin
        clk=0; reset=0; b=4'b0000; #5;
        reset=1; #5;
        reset=0; #10;
        b=4'b0010; #20
        b=4'b0001; #20
        b=4'b0010; #20
        b=4'b0000; #20
        b=4'b1000; #20 
        $finish;
    end
endmodule // guess_FSM_test

