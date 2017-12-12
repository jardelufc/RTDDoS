//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UFC 
// Engineer: Pedro Falcão
// 
// Create Date: 16.07.2017 20:31:56
// Design Name: Adder
// Module Name: Datapath
// Project Name: TCC
// Target Devices: Somar duas entradas e direcionar resultado
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

module adder #(parameter WIDTH=23)
 (input  [WIDTH-1:0] a,b,
 input [1:0]op,
  output  reg [WIDTH:0] o);
 always_comb
  begin
  case (op)
   2'b00:o = a+b;
   2'b01:o = (a+b)>>2;
   2'b10:  if(a>b)
           begin
           o=a-b;
           end
           else
           o=b-a;
   2'b11:o=$unsigned(b-a)>>2;
   default:o=24'bx;
  endcase
    end
endmodule


   
