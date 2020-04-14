`timescale 1ns / 1ps
// Ashlie Lackey and Megan Gordon, ELC 2137, 2020 -03 -05
module bcd11(
    input [10:0] B,
    output [15:0]Boutfinal);
    
    wire [2:0] c12;
    wire [2:0] c23;
    wire [2:0] c34;
    wire [2:0] c45;
    wire [2:0] c56;
    wire [2:0] c67;
    wire [2:0] c78;
    wire [2:0] c910;
    wire [2:0] c1011;
    wire [2:0] c1112;
    wire [2:0] c1213;
    wire [2:0] c1415;
    wire [11:0] Bout;
    wire [12:0] Bout1;
    


//first left to right(c1-c8)
    add3 ic1(.B({0, B[10:8]}), .Bo({Bout[11], c12}));
    
    add3 ic2(.B({c12, B[7]}), .Bo({Bout[10],c23}));
    
    add3 ic3(.B({c23, B[6]}), .Bo({Bout[9],c34}));
    
    add3 ic4(.B({c34, B[5]}), .Bo({Bout[8], c45}));
    
    add3 ic5(.B({c45, B[4]}), .Bo({Bout[7],c56}));
    
    add3 ic6(.B({c56, B[3]}), .Bo({Bout[6],c67}));
    
    add3 ic7(.B({c67, B[2]}), .Bo({Bout[5],c78}));
    
    add3 ic8(.B({c78, B[1]}), .Bo(Boutfinal[4:1]));
//second left to right(c9-c13)
    add3 ic9(.B({0, Bout[11:9]}), .Bo({Bout1[12], c910}));
    
    add3 ic10(.B({c910, Bout[8]}), .Bo({Bout1[11],c1011}));
    
    add3 ic11(.B({c1011, Bout[7]}), .Bo({Bout1[10],c1112}));
    
    add3 ic12(.B({c1112, Bout[6]}), .Bo({Bout1[9],c1213}));
    
    add3 ic13(.B({c1213, Bout[5]}), .Bo(Boutfinal[8:5]));
 //third left to right(c14-c15)
    add3 ic14(.B({0, Bout1[12:10]}), .Bo({Boutfinal[13],c1415}));
   
    add3 ic15(.B({c1415, Bout1[9]}), .Bo(Boutfinal[12:9]));
    
 assign Boutfinal[15:14] = 0;
 assign Boutfinal[0] = B[0];
endmodule