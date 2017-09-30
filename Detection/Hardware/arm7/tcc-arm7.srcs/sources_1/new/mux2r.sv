`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2017 16:33:52
// Design Name: 
// Module Name: mux2r
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


module mux2r(input [23:0] a,b,
               input  sel, data,
                   output reg [23:0] y );

always@(*)  begin                 
     case(sel)
     
     0: y = a;
     1: y =b;
     default: y=24'bx;
     endcase
  end
  always@(*)  begin                 
         case(data)       
        0: y = y;
        1: y =y>>2;
         default: y=24'bx;
         endcase
      end  
endmodule
