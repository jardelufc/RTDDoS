//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2017 16:33:52
// Design Name: 
// Module Name: mux2r
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


module mux2r(input [23:0] a,b,
               input  sel,
                   output reg [23:0] y );

always_comb  begin                 
     case(sel)
     
     0: y = a;
     1: y =b;
     default: y=24'bx;
     endcase
  end
  
endmodule
