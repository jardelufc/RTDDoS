`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2017 15:42:14
// Design Name: 
// Module Name: sqrt_tb
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


module sqrt_tb( );
reg [5:0]b;
    wire [5:0]square;
    
      sqrt sqrt1(.b(b),.square(square));
    
      initial
      begin
        b=25;
       #10
       b=9;
       #10
       b=16;
       #10
       b=0;
       #10
       b=1;
       #10
       b=24;
       #10
       b=21;
       #10
       b=15;
       #10
       b=5;                     
      end
     
    
    endmodule
