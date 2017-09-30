`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2017 16:50:37
// Design Name: 
// Module Name: mul_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mul_tb();
    reg [10:0]a,b;
    wire [21:0] mul;
    
      mul mul1(.a(a),.b(b),.mul(mul));
      initial
          begin
            a=7;
            b=2;
           #10
           a=3;
           b=9;
           #10
           a=2;
           b=6;
           #10
           a=1;
           b=8;
           #10
           a=8;
           b=8;
           #10
           a=2;
           b=100;
           #10
           a=1;
           b=21;
           #10
           b=5;
           b=15;
           #10
           a=1;
           b=5;                     
          end
         
        
endmodule
