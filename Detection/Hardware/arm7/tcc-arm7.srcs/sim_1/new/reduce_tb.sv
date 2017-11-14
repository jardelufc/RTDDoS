`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2017 14:19:51
// Design Name: 
// Module Name: reduce_tb
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


module reduce_tb( );
reg [22:0]a;
 reg clk;
   wire [11:0] out;
   
     reduce r1 (.a(a),.clk(clk),.y(out));
     initial begin
        clk=0;
           forever #1 clk=~clk;
        end
        
     initial
         begin
           a=4095;
 
          
                               
         end
        
endmodule
