`timescale 1ns / 1ps
//Megan Gordon
//ELC 2137  4-21-2020

module guess_FSM #(parameter N=21)
   (input clk, reset,
    input [3:0] y,
    input [3:0] b,
    output reg win,
    output reg lose);
    
   // define states as local parameters (constants)
   localparam [1:0]
      s0  = 2'b00,
      s1  = 2'b01,
      s2  = 2'b11,
      s3  = 2'b10;
      
   // internal signals
   reg [1:0] state, state_next;
  // reg [N-1:0] counter, counter_next;
   reg swin;
   reg slose;
   
   
   // state memory (register)
   always_ff @(posedge clk or posedge reset)
      if (reset) begin
         state   <= s0;
        // counter <= {N{1'b1}};
      end
      else begin
         state   <= state_next;
        // counter <= counter_next;
      end
      
   // combined next-state and output logic
   always_comb begin
      // default behavior
      state_next   = state;
     // counter_next = counter;
      
      case(state)
         s0: begin
            if (y[0])
            //    counter_next = {N{1'b1}};
                if (!b[3]&!b[2]&!b[1]&b[0])
                    state_next = swin;
                else if (b[3]|b[2]|b[1])
                    state_next = slose;
            else
               state_next = s1;
         end
         
         s1: begin
            if (y[1])
               // counter_next = {N{1'b1}};
                if (!b[3]&!b[2]&b[1]&!b[0])
                    state_next = swin;
                else if (b[3]|b[2]|b[0])
                    state_next = slose;
            else
               state_next = s2;
         end
         
         s2: begin
            if (y[2])
               // counter_next = {N{1'b1}};
                if (!b[3]&b[2]&!b[1]&!b[0])
                    state_next = swin;
                else if (b[3]|b[1]|b[0])
                    state_next = slose;
            else
               state_next = s3;
         end
         s3: begin
            if (y[3])
               // counter_next = {N{1'b1}};
                if (b[3]&!b[2]&!b[1]&!b[0])
                    state_next = swin;
                else if (b[2]|b[1]|b[0])
                     state_next = slose;
            else
               state_next = s1;
         end
         
        swin: begin
         // counter_next = counter - 1;
           // if (counter == 0)
              win=4'b0001;
              lose=0;
              if (!b[3]&!b[2]&!b[1]&!b[0])
              state_next = s0;
              else if (b[3]+b[2]+b[1]+b[0])
              state_next = swin;
            end  
            
            slose: begin
            //counter_next = counter - 1;
            //if (counter == 0)
              lose=4'b0001;
              win=0;
              if (!b[3]&!b[2]&!b[1]&!b[0])
              state_next = s0;
              else if (b[3]+b[2]+b[1]+b[0])
              state_next = slose;
            end
            
      endcase
   end
   
endmodule
