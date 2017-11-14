`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2017 16:12:24
// Design Name: 
// Module Name: mux6_tb
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


module mux6_tb();
 reg [22:0] anew,bnew,cnew,dnew,enew,fnew;
  reg [2:0] selnew;
  reg clk;
  wire [22:0] ynew;
mux6 mux4test(.a(anew), .b(bnew),.c(cnew),.d(dnew),.e(enew),.f(fnew),.g(23'b0),.h(23'b0),.clk(clk), .sel(selnew), .y(ynew));

initial begin
   clk=0;
      forever #1 clk=~clk;
   end
initial begin
  
    anew=23'd1212;
    bnew=23'd211;
    cnew=23'd304;
    dnew=23'd211;
    enew=23'd3232;
    fnew=23'd45545;
    #10
     selnew=3'b000;
    #10
    selnew=3'b001;
    #10
    selnew=3'b010;
    #10
    selnew=3'b011;
    #10
    selnew=3'b100;
    #10
    selnew=3'b101;  
    #10
    selnew=3'b110;  
    end
endmodule
