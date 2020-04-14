`timescale 1ns / 1ps
//Megan Gordon, ELC 2137, 2020-04-09

module timer #(parameter N=18)
    (input clk, rst, en,
    output tick
    );
    
    assign en=1;
    
    //internal signals
    reg [N-1:0] Q_reg, Q_next;
    
    //register (state memory)
     always @(posedge clk, posedge rst)
    begin
        if (rst)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end
    
    //next-state logic
    always @*
    begin
        if (en)
            Q_next = Q_reg + 1;
        else
            Q_next = Q_reg; //no change
    end
    
    //output logic
    assign tick = (Q_reg=={N{1'b1}}) ? 1'b1 : 1'b0;

endmodule //timer
