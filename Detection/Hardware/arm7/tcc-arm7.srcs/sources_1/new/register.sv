//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2017 22:35:01
// Design Name: 
// Module Name: register
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


module register #(parameter WIDTH=24) (input [WIDTH-1:0] in, input clk,clr,enable, output reg [WIDTH-1:0] o);



always@(posedge clk)

if(enable)
begin
          if(clr)
           o=0;
          else 
          o=in;
      
     end
     
    
endmodule
