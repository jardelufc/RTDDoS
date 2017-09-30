`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UFC 
// Engineer: Pedro Falcão
// 
// Create Date: 16.07.2017 20:31:56
// Design Name: Multiplex
// Module Name: Datapath
// Project Name: TCC
// Target Devices: Escolha de saída mediante a uma escolha
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


module multiplex(input [10:0]a,b,
                   input sel[1:0],
                   output reg [10:0] y );

always@(*)  begin                 
     if (sel==0) 
        y=a;
     else
        y=b;
  end
  
endmodule
