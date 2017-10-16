`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UFC 
// Engineer: Pedro Falcão
// 
// Create Date: 16.07.2017 20:31:56
// Design Name: Datapath
// Module Name: Datapath
// Project Name: TCC
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:comp
// 
//////////////////////////////////////////////////////////////////////////////////

module Datapath(Rx1,Rx2,Rx3,Ry1,Ry2,Ry3,
selmul3_1,selmul3_2,seladd5_2,seladd5_1,selr7,selsqrt,selmul2_2,selmul2_1,selmul1_2,selmul1_1,seladd2_2,seladd1_1,seldiv_2,seldiv_1,selr11,selr10,selr9,selr8,selr6,selr4,selr3,selr2,selr1,seladd4_2,seladd4_1,seladd3_2,seladd3_1,seladd2_1,seladd1_2,
clk,clr,enable,datasqrt,datadiv,datar11,datar10,datar9,datar8,datar7,datar6,datar5,datar4,datar3,datar2,datar1,opadd1,opadd2,opadd3,opadd4,opadd5);
input [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
//Seletores
input  selmul3_1,selmul3_2,seladd5_2,seladd5_1,selr7,selsqrt,clk,clr,enable,datasqrt,datadiv,datar11,datar10,datar9,datar8,datar7,datar6,datar5,datar4,datar3,datar2,datar1;
input [1:0] selmul2_2,seladd4_1,selmul2_1,selmul1_2,selmul1_1,seladd2_2,seladd1_1,seldiv_2,seldiv_1,selr11,selr10,selr9,selr8,selr6,selr4,selr3,selr2,selr1;
input [2:0] seladd4_2,seladd3_2,seladd3_1,seladd2_1,seladd1_2,opadd1,opadd2,opadd3,opadd4,opadd5; 

wire [23:0] op2add5,op1add5,op2add4,op1add4,op2add3,op1add3,op2add2,op1add2,op2add1,op1add1;
wire [23:0] add5resul,add4resul,add3resul,add2resul,add1resul,add5shifted,add4shifted,add3shifted,add2shifted,add1shifted;
wire [23:0] mul3resul,mul2resul,mul1resul,
op2div,op1div,sqrtresul,
div;
wire [10:0] op2mul3,op1mul3,op2mul2,op1mul2,op2mul1,op1mul1;
wire [21:0] opsqrt;
wire[22:0] Rx1new,Rx2new,Rx3new,Ry1new,Ry2new,Ry3new;
wire [19:0] divresul;
wire [23:0] opR1,opR2,opR3,opR4,opR5,opR6,opR7,opR8,opR9,opR10,opR11;
wire [23:0] R11resul,R10resul,R9resul,R8resul,R7resul,R6resul,R5resul,R4resul,R3resul,R2resul,R1resul;
wire [10:0] R7resulnew,R1resulnew;
wire [11:0] op1divnew,op2divnew;


//extends (Módulo para ajustar entradas de 11 para 23 bits)
extend ex1 (.a(Rx1),.y(Rx1new));
extend ex2 (.a(Rx2),.y(Rx2new));
extend ex3 (.a(Rx3),.y(Rx3new));
extend ey1 (.a(Ry1),.y(Ry1new));
extend ey2 (.a(Ry2),.y(Ry2new));
extend ey3 (.a(Ry3),.y(Ry3new));
//Reduce( Módulo para ajustar Saídas de 24 para 12 bits)

reduce rr7 (.a(R7resul),.y(R7resulnew));
reduce rr1 (.a(R1resul),.y(R1resulnew));

reduce rop1 (.a(op1div),.y(op1divnew));
reduce rop2 (.a(op2div),.y(op2divnew));

/*Multiplexadores parte 1 
Primeira coluna da arquitetura
-- O que recebe?
Entradas dos dados e a realimentação de registradores e variáveis, além disso coloca as entradas em nos valores dos adders.
*/

//Mux dos multiplicadores 
//Multiplexadores do Multiplicador 3 
mux2 mux2mul3(.a(Ry3),.b(Rx3),.sel(selmul3_2),.y(op2mul3));
mux2 mux1mul3(.a(Ry3),.b(Rx3),.sel(selmul3_1),.y(op1mul3));
//Multiplexadores do Multiplicador 2
mux4 mux2mul2(.a(R7resulnew),.b(Ry2),.c(Rx2),.d(0),.sel(selmul2_2),.y(op2mul2));
mux4 mux1mul2(.a(R7resulnew),.b(Ry2),.c(Rx2),.d(0),.sel(selmul2_1),.y(op1mul2));
//Multiplexadores do Multiplicador 1
mux4 mux2mul1(.a(R1resulnew),.b(Ry1),.c(Rx1),.d(0),.sel(selmul1_2),.y(op2mul1));
mux4 mux1mul1(.a(R1resulnew),.b(Ry1),.c(Rx1),.d(0),.sel(selmul1_1),.y(op1mul1));



//Mux dos Somadores 

//Multiplexadores do Somador 5
mux2 mux2add5(.a(R11resul),.b(div),.sel(seladd5_2),.y(op2add5));
mux2 mux1add5(.a(3'b100),.b(R11resul),.sel(seladd5_1),.y(op1add5));
//Multiplexadores do Somador 4
mux6 mux2add4(.a(R1resul),.b(R2resul),.c(Ry3),.d(Ry2),.e(Ry1),.f(0),.g(0),.h(0),.sel(seladd4_2),.y(op2add4));
mux4 mux1add4(.a(R8resul),.b(Rx3),.c(Rx2),.d(Rx1),.sel(seladd4_1),.y(op1add4));
//Multiplexadores do Somador 3
mux6 mux2add3(.a(R10resul),.b(Ry2),.c(Rx2),.d(R9resul),.e(R4resul),.f(R7resul),.g(0),.h(0),.sel(seladd3_2),.y(op2add3));
mux6 mux1add3(.a(R8resul),.b(R2resul),.c(R10resul),.d(R6resul),.e(Ry3),.f(0),.g(0),.h(0),.sel(seladd3_1),.y(op1add3));
//Multiplexadores do Somador 2
mux4 mux2add2(.a(R6resul),.b(R9resul),.c(R3resul),.d(Ry2),.sel(seladd2_2),.y(op2add2));
mux6 mux1add2(.a(R7resul),.b(R1resul),.c(R8resul),.d(R2resul),.e(Ry1),.f(0),.g(0),.h(0),.sel(seladd2_1),.y(op1add2));
//Multiplexadores do Somador 1
mux6 mux2add1(.a(Ry1),.b(R10resul),.c(R4resul),.d(Rx3),.e(Rx1),.f(0),.g(0),.h(0),.sel(seladd1_2),.y(op2add1));
mux4 mux1add1(.a(R8resul),.b(R2resul),.c(R1resul),.d(Rx2),.sel(seladd1_1),.y(op1add1));

/*Multiplicadores e Somadores
segunda coluna da arquitetura
-- O que recebe?
Os dados que os multiplexadores parte 1 selecionam.
*/
mul mul3 (.a(op1mul3),.b(op2mul3),.mul(mul3resul));
mul mul2 (.a(op1mul2),.b(op2mul2),.mul(mul2resul));
mul mul1 (.a(op1mul1),.b(op2mul1),.mul(mul1resul));

adder add5(.a(op1add5),.b(op2add5),.op(opadd5),.o(add5resul));
adder add4(.a(op1add4),.b(op2add4),.op(opadd4),.o(add4resul));
adder add3(.a(op1add3),.b(op2add3),.op(opadd3),.o(add3resul));
adder add2(.a(op1add2),.b(op2add2),.op(opadd2),.o(add2resul));
adder add1(.a(op1add1),.b(op2add1),.op(opadd1),.o(add1resul));

/*Multiplexadores parte 2 
terceira coluna da arquitetura
-- O que recebe?
 Saída dos módulos da parte 2 e variáveis.
*/

//mux raíz quadrada
mux2r muxsqrt(.a(opR9),.b(opR3),.sel(selsqrt),.y(opsqrt));
//mux divisor
mux4r mux2div(.a(opR10),.b(opR6),.c(opR1),.sel(seldiv_2),.y(op2div));
mux4r mux1div(.a(opR3),.b(opR4),.c(opR5),.sel(seldiv_1),.y(op1div));
//mux dos registradores
mux4r muxr11(.a(add5resul),.b(add5shifted),.c(divresul),.sel(selr11),.y(opR11));

mux4r muxr10(.a(add3resul),.b(add4resul),.c(add1shifted),.d(mul3resul),.sel(selr10),.y(opR10));

mux4r muxr9(.a(add3resul),.b(sqrtresul),.c(add2resul),.sel(selr9),.y(opR9));

mux4r muxr8(.a(add1resul),.b(add2resul),.c(mul1resul),.sel(selr8),.y(opR8));

mux2r muxr7(.a(add3shifted),.b(add2resul),.sel(selr7),.y(opR7));

mux4r muxr6(.a(sqrtresul),.b(add4resul),.c(add1shifted),.d(add2resul),.sel(selr6),.y(opR6));

mux4r muxr4(.a(add4resul),.b(mul1resul),.c(mul3resul),.sel(selr4),.y(opR4));

mux4r muxr3(.a(add4resul),.b(add3resul),.c(mul2resul),.sel(selr3),.y(opR3));

mux4r muxr2(.a(add2resul),.b(add3resul),.c(mul1resul),.sel(selr2),.y(opR2));

mux4r muxr1(.a(add4resul),.b(add1shifted),.c(add1resul),.sel(selr1),.y(opR1));

/*Registradores, div e sqrt
quarta coluna da arquitetura
-- O que recebe?
Os dados que os multiplexadores parte 3 selecionam.
*/  
//div div1 (.a(op1divnew),.b(op2divnew),.div(divresul));

div_gen_0 divider (clk,1,op1divnew,1,op2divnew,,divresul);

//sqrt sqrt1(.b(opsqrt),.square(sqrtresul));

cordic_0 sqrtcalc (clk,1,opsqrt,,sqrtresul);


register r1 (.in(opR1),.clk(clk),.clr(clr),.enable(enable),.o(R1resul));
register r2 (.in(opR2),.clk(clk),.clr(clr),.enable(enable),.o(R2resul));
register r3 (.in(opR3),.clk(clk),.clr(clr),.enable(enable),.o(R3resul));
register r4 (.in(opR4),.clk(clk),.clr(clr),.enable(enable),.o(R4resul));
register #(11) r5  (.in(add4resul),.clk(clk),.clr(clr),.enable(enable),.o(R5resul));
register r6 (.in(opR6),.clk(clk),.clr(clr),.enable(enable),.o(R6resul));
register #(12) r7 (.in(opR7),.clk(clk),.clr(clr),.enable(enable),.o(R7resul));
register r8 (.in(opR8),.clk(clk),.clr(clr),.enable(enable),.o(R8resul));
register r9 (.in(opR9),.clk(clk),.clr(clr),.enable(enable),.o(R9resul));
register r10 (.in(opR10),.clk(clk),.clr(clr),.enable(enable),.o(R10resul));
register #(20) r11 (.in(opR11),.clk(clk),.clr(clr),.enable(enable),.o(R11resul));

endmodule




