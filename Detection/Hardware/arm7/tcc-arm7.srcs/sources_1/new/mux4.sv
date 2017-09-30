`timescale 1ns / 1ps
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


module mux4(input [10:0] a,b,c,d,
               input [1:0] sel, 
                   output reg [23:0] y );

always@(*)  begin                 
     case(sel)
     
     2'b00: y = {13'b0,a};
     2'b01: y ={13'b0,b};
     2'b10: y = {13'b0,c};
     2'b11: y = {13'b0,d};
     default: y=24'bx;
     endcase
  end
  
endmodule
