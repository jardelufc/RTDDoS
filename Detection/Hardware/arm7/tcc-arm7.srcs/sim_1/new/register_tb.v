`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2017 22:54:39
// Design Name: 
// Module Name: register_tb
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


module register_tb(
reg [15:0] innew,clknew,clrnew,clkennew;
wire [15:0} onew ;

register r(.in(innew),.clk(clknew),.clr(clrnew),.clken(clkennew),.o(onew));

  initial begin
   innew = 16'd3;
   clknew= 
   #10
 
   #10
  
   end
   

    );
endmodule
