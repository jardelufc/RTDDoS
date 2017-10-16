`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2017 08:23:31
// Design Name: 
// Module Name: div_gen_0_tb
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


module div_gen_0_tb();

reg clk;
reg [12:0] top;
reg[12:0] bottom;
wire  [23:0] out;
reg  [11:0] intout;
 reg  [7:0] fracout;
 reg  [23:0] sum;

div_gen_0 divider (clk,1,bottom,1,top,,out);
initial begin
   clk=0;
      forever #1 clk=~clk;
   end
   
   initial begin
   
   top=12'd80;
   bottom= 12'd9;
   assign intout = out[19:7];
 assign   fracout = out[7:0];
   assign sum= out+out;
   end
   
endmodule
