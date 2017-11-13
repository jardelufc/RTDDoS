`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2017 10:21:43
// Design Name: 
// Module Name: Nahid_tb
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


module Nahid_tb();
reg clk,reset;
reg [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
Nahid n1(.clk(clk),.reset(reset),.Rx1(Rx1),.Rx2(Rx2),.Rx3(Rx3),.Ry1(Ry1),.Ry2(Ry2),.Ry3(Ry3));
initial 
    begin
    clk=1;
    reset=0;
    Rx1=40;
    Rx2=20;
    Rx3=10;
    Ry1=12;
    Ry2=60;
    Ry3=2012;
    #10
    reset=1;
    
    #400
    reset =1;
    end
        always 
           #10 clk=~clk;

endmodule
