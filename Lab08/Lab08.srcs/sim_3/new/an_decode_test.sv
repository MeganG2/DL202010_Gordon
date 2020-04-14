`timescale 1ns / 1ps
// Ashlie Lackey and Megan Gordon, ELC 2137, 2020 -03 -05

module an_decode_test();
    reg [1:0]in_t;
    wire [3:0]out_t;
    
    an_decode an_decode_tester(.in(in_t), .out(out_t));  
     
        
    initial begin
        in_t = 2'b00;
        #10;
        
        in_t = 2'b01;
        #10;
        
        in_t = 2'b10;
        #10;
        
        in_t = 2'b11;
        #10;
    
    $finish ;
    end          
endmodule