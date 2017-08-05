`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2017 19:02:46
// Design Name: 
// Module Name: square_root_tb
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


module square_root_tb( );
reg [3:0]b;
      reg clk;
      wire [3:0]square;
    
      square_root SQT(.b(b),.clk(clk),.square(square));
    
      initial
      begin
        clk=0;
        b=9;
      end
      always
      #1 clk=!clk;
    
    endmodule
