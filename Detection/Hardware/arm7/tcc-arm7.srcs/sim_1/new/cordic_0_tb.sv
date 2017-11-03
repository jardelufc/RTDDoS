`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2017 12:47:11
// Design Name: 
// Module Name: cordic_0_tb
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


module cordic_0_tb();
reg clk,test,ini;
reg [22:0] in;
wire[14:0] out;
cordic_0 sqrtcalc (clk,ini,in,test,out);

initial begin
   clk=0;
   
      forever #1 clk=~clk;
   end
   
   initial begin
  ini=0;
  
   in=24'd100040004;
   #10
   in=24'd16;
   end
   
   

    
endmodule
