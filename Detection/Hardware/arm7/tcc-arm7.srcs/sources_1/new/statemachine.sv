`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2017 11:29:24
// Design Name: 
// Module Name: statemachine
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


module statemachine(input reg[4:0] cycle, input clk,
//reg [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
output reg selmul3_1,selmul3_2,seladd5_2,seladd5_1,selr7,selsqrt,clr,enable,datasqrt,datadiv,datar11,datar10,datar9,datar8,datar7,datar6,datar5,datar4,datar3,datar2,datar1,opadd1,opadd2,opadd3,opadd4,opadd5,
output reg[1:0] selmul2_2,selmul2_1,selmul1_2,selmul1_1,seladd2_2,seladd1_1,seldiv_2,seldiv_1,selr11,selr10,selr9,selr8,selr6,selr4,selr3,selr2,selr1,
output reg [2:0]  seladd4_2,seladd4_1,seladd3_2,seladd3_1,seladd2_1,seladd1_2);


always @(posedge clk)
 begin
case(cycle)
//cycle 0
4'b0000:
begin
seladd1_2<=3'b100;
seladd1_1<=2'b11;
selr1<=2'b10;
opadd1<=1;
datar1<=0;
//ay1
seladd2_2=2'b11;
seladd2_1=3'b100;
selr7=1;
datar7=0;
opadd2=0;

//mx1
selmul1_1=2'b10;
selmul1_2=2'b10;
selr2=2'b10;
datar2=0;

//mx2
selmul2_1=2'b10;
selmul2_2=2'b10;
selr3=2'b10;
datar3=0;
//mx3
selmul3_1=1'b1;
selmul3_2=1'b1;
selr4=2'b10;
datar4=0;

cycle=4'b0001;
end
 //cycle 1
 4'b0001:
begin 
//Mx
seladd1_2=3'b100;
seladd1_1=2'b10;
selr1=2'b10;
datar1=1;
opadd1=0;

//My
seladd3_2=3'b101;
seladd3_1=3'b100;
selr7=2'b00;
datar7=1;
opadd3=0;

// amx1
seladd2_2=2'b10;
seladd2_1=3'b011;
selr2=2'b00;
opadd2=0;
datar2=0;
//my1
selmul1_1=2'b01;
selmul1_2=2'b01;
selr8=2'b10;
datar8=0;

//my2
selmul2_1=2'b01;
selmul2_2=2'b01;
selr9=2'b10;
datar9=0;
//my3
selmul3_1=0;
selmul3_2=0;
selr10=2'b11;
datar10=0;

//newcycle
cycle=4'b0010;

end


 //cycle 2
4'b0010:
begin 
//Mx²
selmul1_2=2'b00;
selmul1_1=2'b00;
selr4=2'b01;
opadd1=0;
datar4=0;

//amy1
seladd2_2=2'b01;
seladd2_1=3'b010;
selr8=2'b01;
opadd2=0;
datar8=0;

//N1
seladd4_2=3'b100;
seladd4_1=2'b11;
opadd4=1;
datar4=0;
//Mx2
seladd1_2=3'b010;
seladd1_1=2'b10;
selr6=2'b10;
datar6=1;
opadd4=0;
//My²
selmul1_2=2'b00;
selmul1_1=2'b00;
selr4=2'b01;
opadd1=0;
datar4=0;
//newcycle
cycle=4'b0011;
end
 //cycle 3
 
4'b0011:
begin
//Vx
seladd3_2=3'b100;
seladd3_1=3'b011;
selr3=2'b01;
datar3=0;
opadd3=1;
//N2
seladd4_2=3'b011;
seladd4_1=2'b10;
selr4=2'b00;
opadd4=1;
datar4=0;

//My²
seladd3_2=3'b011;
seladd3_1=3'b010;
selr9=2'b00;
datar9=1;
opadd3=0;
//newcycle
cycle=4'b0100;
end

 //cycle 4

4'b0100:     
begin
//SDx
selsqrt=1;
selr6=2'b00;
datar6=0;
//N3
seladd4_2=3'b0010;
seladd4_1=2'b01;
opadd4=1;
selr3=2'b00;
datar3=0;
//Vy
seladd3_2=3'b011;
seladd3_1=3'b010;
selr9=2'b00;
datar3=0;
opadd3=1;

//newcycle
cycle=4'b0101;
end
  //cycle 5

4'b0101:

begin
//SDy
selsqrt=0;
selr9=2'b01;
datar6=0;
 
//newcycle
cycle=4'b0110;
end

//cycle 6

4'b0110:

begin
//MSDx
seladd2_2=2'b00;
seladd2_1=3'b001;
opadd2=1;
selr2=2'b0;
datar2=0;
 //newcycle
cycle=4'b0111;
end

//cycle 13

4'b0111:
begin
//DX1
seladd1_2=3'b100;
seladd1_1=2'b01;
opadd1=1;
selr1=2'b10;
datar1=0;


//DX2
seladd3_2=3'b010;
seladd3_1=3'b001;
opadd1=1;
selr2=2'b01;
datar1=0;

//DX3
seladd4_2=3'b001;
seladd4_1=2'b01;
opadd1=1;
selr6=2'b01;
datar1=0;
//newcycle
cycle=4'b1000;
end

//cycle 14

4'b1000:
begin
//DY1
seladd1_2=3'b000;
seladd1_1=2'b00;
opadd1=1;
selr8=2'b00;
datar1=0;

//DY2
seladd1_2=3'b011;
seladd1_1=3'b000;
opadd1=1;
selr9=2'b00;
datar1=0;

//DY3
seladd4_2=3'b011;
seladd4_1=2'b00;
opadd1=1;
selr10=2'b01;
datar1=0;
//newcycle
    cycle=4'b1001;
end

//cycle 15

4'b1001:


begin
//D1
seladd4_2=3'b0;
seladd4_1=2'b0;
opadd4=0;
selr1=2'b00;
datar1=0;
//D2
seladd2_2=2'b01;
seladd2_1=3'b011;
opadd2=0;
selr1=2'b11;
datar1=0;
//D3
seladd3_2=3'b000;
seladd3_1=3'b011;
opadd4=0;
selr10=2'b00;
datar1=0;
 //newcycle
cycle=4'b1010;
 end
 
 //cycle 16
 
4'b1010:

begin
//Q1
seldiv_2=2'b10;
seldiv_1=2'b10;
selr11=2'b10;
datadiv=0;
datar11=0;

//newcycle
cycle=4'b1011;

end 

//cycle 17
 
4'b1011:

begin 
//Q2 e aQ1
seldiv_2=2'b01;
seldiv_1=2'b01;
seladd5_2=1;
datadiv=0;
seladd5_1=1;
selr11=2'b00;
datar11=0;
opadd5=0;
//newcycle
cycle=4'b1100;
end

//cycle 18
 
4'b1100:

begin 
//Q3 e aQ2
seldiv_2=2'b00;
seldiv_1=2'b00;
seladd5_2=1;
seladd5_1=1;
datadiv=0;
selr11=2'b00;
datar11=1;
opadd5=0;


//newcycle
cycle=4'b1101;
end
//cycle 19 
4'b1101:

begin 

//newcycle
cycle=4'b0000;
end


endcase


end



endmodule





