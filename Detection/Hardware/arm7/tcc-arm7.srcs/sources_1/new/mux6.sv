//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2017 15:06:06
// Design Name: 
// Module Name: mux6
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


module mux6(input [22:0] a,b,c,d,e,f,g,h,
               input [2:0] sel, 
               input clk,
                   output reg [22:0] y );

always_comb  begin                 
     case(sel)
     
     3'b000: y = a;
     3'b001: y =  b;
     3'b010: y =  c;
     3'b011: y =  d;
     3'b100: y =  e;
     3'b101: y =  f;
     3'b110: y =  g;
      3'b111: y =  h;
          default: y=23'bx;

     endcase
  end
  
endmodule
