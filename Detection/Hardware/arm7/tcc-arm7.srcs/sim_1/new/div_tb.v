`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2017 18:58:26
// Design Name: 
// Module Name: div_tb
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


module div_tb( );

reg [7:0]a,b;
    wire [7:0] div;
    
      div div1(.a(a),.b(b),.div(div));
    
      initial
      begin
        a=100;
        b=25;
       #10
       a=90;
       b=9;
       #10
       a=320;
       b=16;
       #10
       a=1;
       b=0;
       #10
       a=0;
       b=1;
       #10
       a=12;
       b=24;
       #10
       a=21;
       b=21;
       #10
       b=45;
       b=15;
       #10
       a=205;
       b=5;                     
      end
     
    
endmodule
