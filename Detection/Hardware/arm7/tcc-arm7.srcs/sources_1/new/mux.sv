//`timescale 1ns / 1ps
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

module mux2(input [22:0] a,b,
               input  sel, 
                   output reg [22:0] y );

always_comb  begin                 
     case(sel)    
     0: y =a;
     1: y =b;
     default: y=23'bx;
     endcase
  end
  
endmodule
