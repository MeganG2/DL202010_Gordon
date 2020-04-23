`timescale 1ns / 1ps
//Megan Gordon
//ELC 2137  4-22-2020

module guess_FSM_test();

    reg clk, reset;
    reg [3:0] y;
    reg [3:0] b;
    wire win, lose;
    integer i;
    
    guess_FSM #(.N(21))guess1(.clk(clk), .reset(reset), .b(b), .y(y), .win(win), .lose(lose));
        
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk=0; reset=0; b=4'b0000; #5;
        reset=1; #10;
        reset=0; #5;
        y=4'b0001;
        // bounce
        for (i=0; i<10; i=i+1) begin
            #20 b=~b;
        end
        // hold b = 1 for a while
        b = 4'b0001; #200;
        // bounce
        for (i=0; i<10; i=i+1) begin
            #20 b=~b;
        end
        // hold input = 0 for a while
        b = 4'b0000; #200;
        $finish;
    end
endmodule // guess_FSM_test

