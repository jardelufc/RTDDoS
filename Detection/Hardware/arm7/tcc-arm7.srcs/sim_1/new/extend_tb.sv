`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2017 09:26:35
// Design Name: 
// Module Name: extend_tb
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


module extend_tb( );
 reg [21:0]a;

   wire [23:0] out;
   
     extend #(22) e1 (.a(a),.y(out));
    
        
     initial
         begin
           a=7;
   
          #10
          a=3;
         
          #10
          a=2;
         
          #10
          a=1;
         
          #10
          a=8;
          
          #10
          a=2;
         
          #10
          a=1;
         
          #10
          a=5;
          
          #10
          a=11;
                               
         end
        
endmodule
