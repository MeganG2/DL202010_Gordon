`timescale 1ns / 1ps
//Megan Gordon, ELC 2137, 2020-04-09

module counter2 #(parameter N=2)
    (input clk, rst, en,
    output [N-1:0] count
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
    assign count = Q_reg;

endmodule //counter2