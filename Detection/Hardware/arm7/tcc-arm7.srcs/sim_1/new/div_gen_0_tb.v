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
wire m_axis_dout_tvalid;
reg [11:0] top;
reg[11:0] bottom;
wire  [19:0] out;


div_gen_0 divider (clk,1,bottom,1,top,m_axis_dout_tvalid,out);
initial begin
   clk=0;
      forever #1 clk=~clk;
   end
   
   initial begin
   
   top=12'd80;
   bottom= 12'd9;

   end
   
endmodule
