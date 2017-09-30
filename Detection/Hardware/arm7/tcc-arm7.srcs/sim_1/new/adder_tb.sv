`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2017 21:30:02
// Design Name: 
// Module Name: adder_tb
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


module adder_tb( );
 reg [11:0] anew,bnew;
   wire [12:0] onew;

        
   adder a(.a(anew),.b(bnew),.o(onew));
   
   //Para teste de instância (valores) serão atribuidos três exemplos de valores de entrada no intervalo de 10ns
   initial begin
   anew = 23'd3;
   bnew=  23'd5;
   #10
   anew = 23'd10;
   bnew=  23'd6;
   #10
   anew= 23'd9;
   bnew= 23'd1;
   end
   
endmodule
