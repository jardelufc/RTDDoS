`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2017 14:55:15
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


module register_tb( );
reg [15:0] innew;
reg clknew,clrnew,enable;
wire [15:0] onew;
register r(.in(innew), .clk(clknew),.clr(clrnew),.enable(enable), .o(onew));
initial begin
clknew=1'b0;


end

initial begin

innew=16'd5;
clrnew=0;
enable=1;
#5
innew=12'd3;
clrnew=0;
enable=1;
#5
innew=14'd4;
clrnew=0;
enable=0;


end

always begin
    #1 clknew=~clknew;   
end 
   
endmodule
