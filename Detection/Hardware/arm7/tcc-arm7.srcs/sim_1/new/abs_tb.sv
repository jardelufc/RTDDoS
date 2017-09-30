`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2017 19:54:32
// Design Name: 
// Module Name: abs_tb
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


module abs_tb();
reg  [10:0] a;
wire  [10:0] out;

abs abs1(.a(a),.out(out));

 initial
      begin
      a=-25;
       #10
       a=-9;
       #10
       a=16;
       #10
       a=0;
       #10
       a=-1;
                          
      end
     

endmodule
