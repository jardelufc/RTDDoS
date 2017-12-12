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
reg [19:0] R11resul;
reg [19:0] threshold;
Nahid n1(.clk(clk),.reset(reset),.Rx1(Rx1),.Rx2(Rx2),.Rx3(Rx3),.Ry1(Ry1),.Ry2(Ry2),.Ry3(Ry3),.R11resul(R11resul),.threshold(threshold));
initial 
    begin
    clk=1;
    reset=0;
    Rx1=365;
    Rx2=252;
    Rx3=953;
    Ry1=140;
    Ry2=200;
    Ry3=970;
    threshold=20'b00000000000011011010;
    #10
    reset=1;
    
    #860
    reset=0;
    end
        always 
           #1 clk=~clk;

endmodule
