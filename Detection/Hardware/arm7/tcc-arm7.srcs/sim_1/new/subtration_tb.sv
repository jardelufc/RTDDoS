`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2017 17:54:40
// Design Name: 
// Module Name: subtration_tb
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
module subtration_tb();
reg a,b [10:0];
wire s [10:0];
subtration sub1 (.a(a),.b(b),.s(s)); 

 initial
         begin
           a=7;
           b=2;                       
         end
endmodule
