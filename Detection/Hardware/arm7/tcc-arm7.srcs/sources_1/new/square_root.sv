`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2017 19:00:21
// Design Name: 
// Module Name: square_root
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


module square_root(b,clk,square);

input [3:0] b;
input clk;
output [3:0]square;
reg[3:0]a,square;
reg[2:0] d;

initial
  begin
    d=3'b001;
  end

always@(clk)
  begin
    a=d*d;
    if(a==b)
      square=d;
    else
      d=d+1;
  end
endmodule
