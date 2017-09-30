`timescale 1ns / 1ps
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


module mux6(input [10:0] a,b,c,d,e,f,
               input [2:0] sel, 
                   output reg [23:0] y );

always@(*)  begin                 
     case(sel)
     
     3'b000: y = {13'b0,a};
     3'b001: y =  {13'b0,b};
     3'b010: y =  {13'b0,c};
     3'b011: y =  {13'b0,d};
     3'b100: y =  {13'b0,e};
     3'b101: y =  {13'b0,f};
          default: y=24'bx;

     endcase
  end
  
endmodule
