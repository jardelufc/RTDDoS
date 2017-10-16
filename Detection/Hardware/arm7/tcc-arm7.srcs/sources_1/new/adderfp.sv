`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2017 10:42:54
// Design Name: 
// Module Name: adderfp
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


module adderfp#(parameter WIDTH=20)
 (input  [WIDTH-1:0] a,b,
 input [1:0]op,
 input clk,
  output  reg [WIDTH:0] o);
 always@(posedge clk)begin
  case (op)
   2'b00:o = a+b;
   2'b01:o = (a+b)>>2;
   2'b10:o=$unsigned(a-b);
   2'b11:o=$unsigned(a-b)>>2;
   default:o=20'bxx;
  endcase
  
    end
endmodule
