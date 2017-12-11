//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2017 14:07:25
// Design Name: 
// Module Name: reduce
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
module reduce(input [23:0] a,
              output reg [10:0] y);
 
     always_comb
  
             y =a[10:0];  
                      
 endmodule

