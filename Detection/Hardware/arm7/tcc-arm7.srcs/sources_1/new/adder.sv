`timescale 1ns / 1ps
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
 (input [WIDTH-1:0] a,b,output  [WIDTH-1:0] o);
    assign o = a+b;
endmodule


   
