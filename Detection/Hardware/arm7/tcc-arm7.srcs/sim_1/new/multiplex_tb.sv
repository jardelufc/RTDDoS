`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2017 21:04:32
// Design Name: 
// Module Name: multiplex_tb
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


module mux_tb( );

  reg [10:0] anew,bnew;
     reg selnew;
     wire [22:0] ynew;

    
    mux2 m(.a(anew), .b(bnew), .sel(selnew), .y(ynew));
    
    initial begin
    selnew=0;
    anew=4'b0010;
    bnew=4'b0110;
    #10
     selnew=~selnew;
    #10
    selnew=~selnew;
    #10
    selnew=~selnew;
    #10
    selnew=~selnew;
  
    end
endmodule
