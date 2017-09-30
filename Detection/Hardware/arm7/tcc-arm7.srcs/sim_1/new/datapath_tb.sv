`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2017 22:59:27
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb( );
reg [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
reg  selmul3_1,selmul3_2,seladd5_2,seladd5_1,selr7,selsqrt,clk,clr,enable,datasqrt,datadiv,datar11,datar10,datar9,datar8,datar7,datar6,datar5,datar4,datar3,datar2,datar1;
reg [1:0] selmul2_2,selmul2_1,selmul1_2,selmul1_1,seladd2_2,seladd1_1,seldiv_2,seldiv_1,selr11,selr10,selr9,selr8,selr6,selr4,selr3,selr2,selr1;
reg[2:0] seladd4_2,seladd4_1,seladd3_2,seladd3_1,seladd2_1,seladd1_2; 
reg[4:0] cycle;
Datapath data1 (.Rx1(Rx1),.Rx2(Rx2),.Rx3(Rx3),.Ry1(Ry1),.Ry2(Ry2),.Ry3(Ry3),
.selmul3_1(selmul3_1),.selmul3_2(selmul3_2),.seladd5_2(seladd5_2),.seladd5_1(seladd5_1),.selr7(selr7),.selsqrt(selsqrt),.datasqrt(datasqrt),.datadiv(datadiv),.datar11(datar11),.datar10(datar10),.datar9(datar9),.datar8(datar8),.datar7(datar7),.datar6(datar6),.datar5(datar5),.datar4(datar4),.datar3(datar3),.datar2(datar2),.datar1(datar1),
.selmul2_2(selmul2_2),.selmul2_1(selmul2_1),.selmul1_2(selmul1_2),.selmul1_1(selmul1_1),.seladd2_2(seladd2_2),.seladd1_1(seladd1_1),.seldiv_2(seldiv_2),.seldiv_1(seldiv_1),.selr11(selr11),.selr10(selr10),.selr9(selr9),.selr8(selr8),.selr6(selr6),.selr4(selr4),.selr3(selr3),.selr2(selr2),.selr1(selr1),
.seladd4_2(seladd4_2),.seladd4_1(seladd4_1),.seladd3_2(seladd3_2),.seladd3_1(seladd3_1),.seladd2_1(seladd2_1),.seladd1_2(seladd1_2),.clk(clk),.clr(clr),.enable(enable));
initial
begin
clk=1;
enable=1;
clr=0;
end
always 
#10 clk=~clk;


initial
begin
    //entradas
Rx1=11'd40;
Rx2=11'd20;
Rx3=11'd10;
Ry1=11'd300;
Ry2=11'd323;
Ry3=11'd100;
//seletores

//ciclo 1

//ax1
seladd1_2=3'b100;
seladd1_1=2'b11;
selr1=2'b10;
datar1=1;
//ay1
seladd2_2=2'b11;
seladd2_1=3'b100;
selr7=1;

//mx1
selmul1_1=2'b10;
selmul1_2=2'b10;
selr2=2'b10;

//mx2
selmul2_1=2'b10;
selmul2_2=2'b10;
selr3=2'b10;

//mx3
selmul3_1=1'b1;
selmul3_2=1'b1;
selr4=2'b10;

//ciclo 2


end
endmodule
