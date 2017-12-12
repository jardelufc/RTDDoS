//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2017 16:35:50
// Design Name: 
// Module Name: mux4r
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


module mux4r(input [23:0] a,b,c,d,
               input [1:0] sel,
                   output reg [23:0] y );

always_comb  begin                 
     case(sel)   
     2'b00: y = a;
     2'b01: y =b;
     2'b10: y = c;
     2'b11: y = d;
     default: y=23'bx;
     endcase
  end
endmodule
