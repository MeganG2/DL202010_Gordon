`timescale 1ns / 1ps
// Ashlie Lackey and Megan Gordon, ELC 2137, 2020 -03 -05
module mux2_test();
    reg [1:0]in0_t, in1_t;
    reg sel_t;
    wire [1:0]out_t;
    
    mux2 mux2test(.in1(in1_t), .in0(in0_t), .sel(sel_t), .out(out_t));
    
    initial begin
        in0_t = 2'b00;
        in1_t = 2'b01;
        sel_t = 0;
        #10;
        
        in0_t = 2'b01;
        in1_t = 2'b10;
        sel_t = 1;
        #10;
        
        in0_t = 2'b10;
        in1_t = 2'b01;
        sel_t = 0;
        #10;
        
        in0_t = 2'b10;
        in1_t = 2'b01;
        sel_t = 1;
        #10;
    
    $finish ;
    end
endmodule   //mux2_test