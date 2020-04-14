`timescale 1ns / 1ps
// Ashlie Lackey and Megan Gordon, ELC 2137, 2020 -03 -05
module mux4_test();
    reg [3:0]in0_t, in1_t,in2_t, in3_t;
    reg [1:0]sel_t;
    wire [3:0]out_t;
    
    mux4 mux4test(.in3(in3_t), .in2(in2_t), .in1(in1_t), .in0(in0_t), .sel(sel_t), .out(out_t));
    
    initial begin
        in0_t = 4'b0000;
        in1_t = 4'b0001;
        in2_t = 4'b0010;
        in3_t = 4'b0011;
        sel_t = 0;
        #10;
        
        in0_t = 4'b0000;
        in1_t = 4'b0001;
        in2_t = 4'b0010;
        in3_t = 4'b0011;
        sel_t = 1;
        #10;
        
        in0_t = 4'b0000;
        in1_t = 4'b0001;
        in0_t = 4'b0010;
        in1_t = 4'b0011;
        sel_t = 2;
        #10;
        
        in0_t = 4'b0000;
        in1_t = 4'b0001;
        in0_t = 4'b0010;
        in1_t = 4'b0011;
        sel_t = 3;
        #10;
    
    $finish ;
    end
endmodule   //mux4_test