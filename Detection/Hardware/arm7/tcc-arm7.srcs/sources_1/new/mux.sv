`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2017 14:19:47
// Design Name: 
// Module Name: mux
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

module mux2(input [10:0] a,b,
               input  sel, 
                   output reg [23:0] y );

always@(*)  begin                 
     case(sel)
     
     0: y ={13'b0,a};
     1: y ={13'b0,b};
     default: y=11'bx;
     endcase
  end
  
endmodule
