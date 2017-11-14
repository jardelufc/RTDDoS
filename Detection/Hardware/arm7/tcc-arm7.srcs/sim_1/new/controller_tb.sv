`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2017 12:53:26
// Design Name: 
// Module Name: controller_tb
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


module controller_tb();
reg clk,reset;

controller c1(.clk(clk),.reset(reset));
initial 
    begin
    clk=1;
    reset=0;
    #10
    reset=1;
    
    #400
    reset =1;
    end
        always 
           #10 clk=~clk;
endmodule
