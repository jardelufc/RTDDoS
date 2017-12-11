//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2017 14:53:42
// Design Name: 
// Module Name: mux4
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


module mux4(input [22:0] a,b,c,d,
               input [1:0] sel,
               input clk,
                   output reg [22:0] y );

always_comb  begin                 
     case(sel)
     
     2'b00: y = a;
     2'b01: y = b;
     2'b10: y = c;
     2'b11: y = d;
     default: y=23'bx;
     endcase
  end
  
endmodule
