`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2017 14:33:27
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


module adder_tb();
reg [22:0] a;
reg [22:0] b;
reg [1:0] op;
reg [23:0] out;

adder a1 (.a(a),.b(b),.op(op),.o(out));

initial 
begin
a=500;
b=222;
op=2'b00;
#10

a=500;
b=222;
op=2'b01;
#10

a=500;
b=222;
op=2'b10;
#10

a=500;
b=222;
op=2'b11;

end

endmodule
