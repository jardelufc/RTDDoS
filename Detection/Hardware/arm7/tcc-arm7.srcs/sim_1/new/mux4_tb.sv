`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2017 15:37:34
// Design Name: 
// Module Name: mux4_tb
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


module mux4_tb();
  reg [22:0] anew,bnew,cnew,dnew;
   reg [1:0] selnew;
   reg clk;
   wire [22:0] ynew;
mux4 mux4test(.a(anew), .b(bnew),.c(cnew),.d(dnew),.clk(clk), .sel(selnew), .y(ynew));

initial begin
   clk=0;
      forever #1 clk=~clk;
   end
initial begin
    selnew=0;
    anew=23'd1212;
    bnew=23'd211;
    cnew=23'd304;
    dnew=21'd21;
    #10
     selnew=2'b00;
    #10
    selnew=2'b01;
    #10
    selnew=2'b10;
    #10
    selnew=2'b11;
  
    end
endmodule
