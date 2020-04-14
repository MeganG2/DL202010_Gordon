`timescale 1ns / 1ps
//Megan Gordon, ELC 2137, 2020-04-09

module counter_test();

reg clk;
wire [3:0] count;
wire clkA;
wire clkB;
wire clkC;
reg en, rst;

assign clkA = count[0];
assign clkB = count[1];
assign clkC = count[2];

counter #(.N(4)) r(.clk(clk), 
        .en(en), .rst(rst), .count(count));
        
    always begin 
        clk = ~clk; #5;
    end //clock constantly runs
    
    initial begin
        clk=0; rst=0; en=0; #5;
        rst=1; #5; //reset
        rst=0; en=1; #5;
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        en=1; #5
        en=0; #5;
        $finish;
    end
        
endmodule

