`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2017 16:35:24
// Design Name: 
// Module Name: Nahid
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
module Nahid(clk,reset,Rx1,Rx2,Rx3,Ry1,Ry2,Ry3,R11Resul);
//entrada do controller
input clk,reset;
//entrada do datapath
input [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
output [23:0] R11Resul;
reg selmul3_1,selmul3_2,seladd5_2,seladd5_1,selr7,selsqrt,clr1,clr2,clr3,clr4,clr5,clr6,clr7,clr8,clr9,clr10,clr11,enable1,enable2,enable3,enable4,enable5,enable6,enable7,enable8,enable9,enable10,enable11,valid,insqrt,valid2,inbottom,intop;
reg clrx1,clrx2,clrx3,clry1,clry2,clry3,enablex1,enablex2,enablex3,enabley1,enabley2,enabley3;
reg [1:0] selmul2_2,selmul2_1,selmul1_2,selmul1_1,seladd2_2,seladd1_1,seldiv_2,seldiv_1,selr11,selr10,selr9,selr8,selr6,selr4,selr3,selr2,selr1;
reg [2:0] seladd4_2,seladd4_1,seladd3_2,seladd3_1,seladd2_1,seladd1_2;
reg [1:0] opadd1,opadd2,opadd3,opadd4,opadd5;
reg [23:0] R11resul;
Datapath data1 (.Rx1(Rx1),.Rx2(Rx2),.Rx3(Rx3),.Ry1(Ry1),.Ry2(Ry2),.Ry3(Ry3),.selmul3_1(selmul3_1),.selmul3_2(selmul3_2),.seladd5_2(seladd5_2),.seladd5_1(seladd5_1),.selr7(selr7),.selsqrt(selsqrt),.selmul2_2(selmul2_2),.selmul2_1(selmul2_1),.selmul1_2(selmul1_2),.selmul1_1(selmul1_1),.seladd2_2(seladd2_2),.seladd1_1(seladd1_1),.seldiv_2(seldiv_2),.seldiv_1(seldiv_1),.selr11(selr11),.selr10(selr10),.selr9(selr9),.selr8(selr8),.selr6(selr6),.selr4(selr4),.selr3(selr3),.selr2(selr2),.selr1(selr1),.seladd4_2(seladd4_2),.seladd4_1(seladd4_1),.seladd3_2(seladd3_2),.seladd3_1(seladd3_1),.seladd2_1(seladd2_1),.seladd1_2(seladd1_2),.clk(clk),.clr1(clr1),.clr2(clr2),.clr3(clr3),.clr4(clr4),.clr5(clr5),.clr6(clr6),.clr7(clr7),.clr8(clr8),.clr9(clr9),.clr10(clr10),.clr11(clr11),.enable1(enable1),.enable2(enable2),.enable3(enable3),.enable4(enable4),.enable5(enable5),.enable6(enable6),.enable7(enable7),.enable8(enable8),.enable9(enable9),.enable10(enable10),.enable11(enable11), .opadd1(opadd1),.opadd2(opadd2),.opadd3(opadd3),.opadd4(opadd4),.opadd5(opadd5),.clrx1(clrx1),.clrx2(clrx2),.clrx3(clrx3),.clry1(clry1),.clry2(clry2),.clry3(clry3),.enablex1(enablex1),.enablex2(enablex2),.enablex3(enablex3),.enabley1(enabley1),.enabley2(enabley2),.enabley3(enabley3),
.insqrt(insqrt),.valid(valid),.valid2(valid2),.inbottom(inbottom),.intop(intop),.R11resul(R11resul));

controller c1 (.clk(clk),.reset(reset),.selmul3_1(selmul3_1),.selmul3_2(selmul3_2),.seladd5_2(seladd5_2),.seladd5_1(seladd5_1),.selr7(selr7),.selsqrt(selsqrt),.selmul2_2(selmul2_2),.selmul2_1(selmul2_1),.selmul1_2(selmul1_2),.selmul1_1(selmul1_1),.seladd2_2(seladd2_2),.seladd1_1(seladd1_1),.seldiv_2(seldiv_2),.seldiv_1(seldiv_1),.selr11(selr11),.selr10(selr10),.selr9(selr9),.selr8(selr8),.selr6(selr6),.selr4(selr4),.selr3(selr3),.selr2(selr2),.selr1(selr1),.seladd4_2(seladd4_2),.seladd4_1(seladd4_1),.seladd3_2(seladd3_2),.seladd3_1(seladd3_1),.seladd2_1(seladd2_1),.seladd1_2(seladd1_2),.clr1(clr1),.clr2(clr2),.clr3(clr3),.clr4(clr4),.clr5(clr5),.clr6(clr6),.clr7(clr7),.clr8(clr8),.clr9(clr9),.clr10(clr10),.clr11(clr11),.enable1(enable1),.enable2(enable2),.enable3(enable3),.enable4(enable4),.enable5(enable5),.enable6(enable6),.enable7(enable7),.enable8(enable8),.enable9(enable9),.enable10(enable10),.enable11(enable11), .opadd1(opadd1),.opadd2(opadd2),.opadd3(opadd3),.opadd4(opadd4),.opadd5(opadd5),.clrx1(clrx1),.clrx2(clrx2),.clrx3(clrx3),.clry1(clry1),.clry2(clry2),.clry3(clry3),.enablex1(enablex1),.enablex2(enablex2),.enablex3(enablex3),.enabley1(enabley1),.enabley2(enabley2),.enabley3(enabley3),
.insqrt(insqrt),.valid(valid),.valid2(valid2),.inbottom(inbottom),.intop(intop));


endmodule
