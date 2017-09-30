`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2017 08:55:07
// Design Name: 
// Module Name: statemachine_tb
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


module statemachine_tb();
reg [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
reg clk=0;
reg [4:0] cycle=4'b0000;

statemachine state (.cycle(cycle),.clk(clk));
initial

forever #1 clk=~clk;

endmodule
