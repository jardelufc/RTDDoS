`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2017 18:13:32
// Design Name: 
// Module Name: shifted
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


module shifted(add,shifteradd);
input [23:0] add;
output[23:0] shifteradd;
assign shifteradd = add>>2;
endmodule
