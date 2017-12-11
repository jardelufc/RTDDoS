//`timescale 1ns / 1ps
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
clk,clr1,clr2,clr3,clr4,clr5,clr6,clr7,clr8,clr9,clr10,clr11,clrx1,clrx2,clrx3,clry1,clry2,clry3,enable1,enable2,enable3,enable4,enable5,enable6,enable7,enable8,enable9,enable10,enable11,enablex1,enablex2,enablex3,enabley1,enabley2,enabley3,datasqrt,datadiv,datar11,datar10,datar9,datar8,datar7,datar6,datar5,datar4,datar3,datar2,datar1,opadd1,opadd2,opadd3,opadd4,opadd5,R11resul,
valid,insqrt,valid2,inbottom,intop);
input [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
//Seletores
input  selmul3_1,selmul3_2,seladd5_2,seladd5_1,selr7,selsqrt,clk,clr1,clr2,clr3,clr4,clr5,clr6,clr7,clr8,clr9,clr10,clr11,clrx1,clrx2,clrx3,clry1,clry2,clry3,enable1,enable2,enable3,enable4,enable5,enable6,enable7,enable8,enable9,enable10,enable11,enablex1,enablex2,enablex3,enabley1,enabley2,enabley3,datasqrt,datadiv,datar11,datar10,datar9,datar8,datar7,datar6,datar5,datar4,datar3,datar2,datar1,insqrt,inbottom,intop;
input [1:0] selmul2_2,seladd4_1,selmul2_1,selmul1_2,selmul1_1,seladd2_2,seladd1_1,seldiv_2,seldiv_1,selr11,selr10,selr9,selr8,selr6,selr4,selr3,selr2,selr1,opadd1,opadd2,opadd3,opadd4,opadd5;
input [2:0] seladd4_2,seladd3_2,seladd3_1,seladd2_1,seladd1_2; 
output valid,valid2;
output [19:0] R11resul ;
wire  clrx1,clrx2,clrx3,clry1,clry2,clry3,enablex1,enablex2,enablex3,enabley1,enabley2,enabley3,valid,valid2;
wire [23:0] op2add5,op1add5,op2add4,op1add4,op2add3,op1add3,op2add2,op1add2,op2add1,op1add1;
wire [23:0] add5resul,add4resul,add3resul,add2resul,add1resul,add5shifted,add4shifted,add3shifted,add2shifted,add1shifted;
wire [23:0] mul3resul,mul2resul,mul1resul,
op2div,op1div,sqrtresul,
div;
wire [10:0] op2mul3,op1mul3,op2mul2,op1mul2,op2mul1,op1mul1,x1r,x2r,x3r,y1r,y2r,y3r;
wire [22:0] Rx1new,Rx2new,Rx3new,Ry1new,Ry2new,Ry3new,R7ex,R5ex,R11ex,divnew;
wire [19:0] divresul;
wire [23:0] opR1,opR2,opR3,opR4,opR5,opR6,opR7,opR8,opR9,opR10,opR11,opsqrt,sqrtresulnew;
wire [23:0] R10resul,R9resul,R8resul,R7resul,R6resul,R5resul,R4resul,R3resul,R2resul,R1resul;
wire [10:0] R7resulnew,R1resulnew;
wire [11:0] op1divnew,op2divnew;


//extends (Módulo para ajustar entradas de 11 para 23 bits)
extend ex1 (.a(x1r),.y(Rx1new));
extend ex2 (.a(x2r),.y(Rx2new));
extend ex3 (.a(x3r),.y(Rx3new));
extend ey1 (.a(y1r),.y(Ry1new));
extend ey2 (.a(y2r),.y(Ry2new));
extend ey3 (.a(y3r),.y(Ry3new));
extend #(12) er7 (.a(R7resul),.y(R7ex));
extend #(16) sqrt (.a(sqrtresul),.y(sqrtresulnew));
extend er5 (.a(R5resul),.y(R5ex));
extend er1  (.a(R1resul),.y(R1ex));
extend #(20) er11 (.a(R11resul),.y(R11ex));
extend #(20) ediv (.a(divresul),.y(divnew));
//Reduce(Módulo para ajustar Saídas de 24 para 12 bits)

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
mux2 mux2mul3(.a(y3r),.b(x3r),.sel(selmul3_2),.y(op2mul3));
mux2 mux1mul3(.a(y3r),.b(x3r),.sel(selmul3_1),.y(op1mul3));
//Multiplexadores do Multiplicador 2
mux4 mux2mul2(.a(R7resulnew),.b(y2r),.c(x2r),.d(0),.sel(selmul2_2),.y(op2mul2));
mux4 mux1mul2(.a(R7resulnew),.b(y2r),.c(x2r),.d(0),.sel(selmul2_1),.y(op1mul2));
//Multiplexadores do Multiplicador 1
mux4 mux2mul1(.a(R1resulnew),.b(y1r),.c(x1r),.d(0),.sel(selmul1_2),.y(op2mul1));
mux4 mux1mul1(.a(R1resulnew),.b(y1r),.c(x1r),.d(0),.sel(selmul1_1),.y(op1mul1));



//Mux dos Somadores 

//Multiplexadores do Somador 5
mux2 mux2add5(.a(R11ex),.b(divnew),.sel(seladd5_2),.y(op2add5));
mux2 mux1add5(.a(24'b000000000000000100000000),.b(R11ex),.sel(seladd5_1),.y(op1add5));
//Multiplexadores do Somador 4
mux6 mux2add4(.a(R1resul),.b(R2resul),.c(Ry3new),.d(Ry2new),.e(Ry1new),.f(0),.g(0),.h(0),.sel(seladd4_2),.y(op2add4));
mux4 mux1add4(.a(R8resul),.b(Rx3new),.c(Rx2new),.d(Rx1new),.sel(seladd4_1),.y(op1add4));
//Multiplexadores do Somador 3
mux6 mux2add3(.a(R10resul),.b(Ry2new),.c(Rx2new),.d(R9resul),.e(R4resul),.f(R7ex),.g(0),.h(0),.sel(seladd3_2),.y(op2add3));
mux6 mux1add3(.a(R8resul),.b(R2resul),.c(R10resul),.d(R6resul),.e(Ry3new),.f(0),.g(0),.h(0),.sel(seladd3_1),.y(op1add3));
//Multiplexadores do Somador 2
mux4 mux2add2(.a(R6resul),.b(R9resul),.c(R3resul),.d(Ry2new),.sel(seladd2_2),.y(op2add2));
mux6 mux1add2(.a(R7ex),.b(R1resul),.c(R8resul),.d(R2resul),.e(Ry1new),.f(0),.g(0),.h(0),.sel(seladd2_1),.y(op1add2));
//Multiplexadores do Somador 1
mux6 mux2add1(.a(Ry1new),.b(R10resul),.c(R4resul),.d(Rx3new),.e(Rx1new),.f(0),.g(0),.h(0),.sel(seladd1_2),.y(op2add1));
mux4 mux1add1(.a(R8resul),.b(R2resul),.c(R1resul),.d(Rx2new),.sel(seladd1_1),.y(op1add1));

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
mux2r muxsqrt(.a(R9resul),.b(R3resul),.sel(selsqrt),.y(opsqrt));
//mux divisor
mux4r mux2div(.a(R10resul),.b(R6resul),.c(R1resul),.sel(seldiv_2),.y(op2div));
mux4r mux1div(.a(R3resul),.b(R4resul),.c(R5ex),.sel(seldiv_1),.y(op1div));
//mux dos registradores
mux4r muxr11(.a(add5resul),.b(add5resul),.c(divresul),.sel(selr11),.y(opR11));

mux4r muxr10(.a(add3resul),.b(add4resul),.c(add1resul),.d(mul3resul),.sel(selr10),.y(opR10));

mux4r muxr9(.a(add3resul),.b(sqrtresulnew),.c(mul2resul),.sel(selr9),.y(opR9));

mux4r muxr8(.a(add1resul),.b(add2resul),.c(mul1resul),.sel(selr8),.y(opR8));

mux2r muxr7(.a(add3resul),.b(add2resul),.sel(selr7),.y(opR7));

mux4r muxr6(.a(sqrtresulnew),.b(add4resul),.c(add1resul),.d(add2resul),.sel(selr6),.y(opR6));

mux4r muxr4(.a(add4resul),.b(mul1resul),.c(mul3resul),.sel(selr4),.y(opR4));

mux4r muxr3(.a(add4resul),.b(add3resul),.c(mul2resul),.d(0),.sel(selr3),.y(opR3));

mux4r muxr2(.a(add2resul),.b(add3resul),.c(mul1resul),.sel(selr2),.y(opR2));

mux4r muxr1(.a(add4resul),.b(add1shifted),.c(add1resul),.sel(selr1),.y(opR1));

/*Registradores, div e sqrt
quarta coluna da arquitetura
-- O que recebe?
Os dados que os multiplexadores parte 3 selecionam.
*/  
//div div1 (.a(op1divnew),.b(op2divnew),.div(divresul));

div_gen_0 divider (clk,inbottom,op2div,intop,op1div,valid2,divresul);

//sqrt sqrt1(.b(opsqrt),.square(sqrtresul));

cordic_0 sqrtcalc (clk,insqrt,opsqrt,valid,sqrtresul);


register r1 (.in(opR1),.clk(clk),.clr(clr1),.enable(enable1),.o(R1resul));
register r2 (.in(opR2),.clk(clk),.clr(clr2),.enable(enable2),.o(R2resul));
register r3 (.in(opR3),.clk(clk),.clr(clr3),.enable(enable3),.o(R3resul));
register r4 (.in(opR4),.clk(clk),.clr(clr4),.enable(enable4),.o(R4resul));
register #(11) r5  (.in(add4resul),.clk(clk),.clr(clr5),.enable(enable5),.o(R5resul));
register r6 (.in(opR6),.clk(clk),.clr(clr6),.enable(enable6),.o(R6resul));
register #(12) r7 (.in(opR7),.clk(clk),.clr(clr7),.enable(enable7),.o(R7resul));
register r8 (.in(opR8),.clk(clk),.clr(clr8),.enable(enable8),.o(R8resul));
register r9 (.in(opR9),.clk(clk),.clr(clr9),.enable(enable9),.o(R9resul));
register r10 (.in(opR10),.clk(clk),.clr(clr10),.enable(enable10),.o(R10resul));
register #(20) r11 (.in(opR11),.clk(clk),.clr(clr11),.enable(enable11),.o(R11resul));

register #(11) x1 (.in(Rx1),.clk(clk),.clr(clrx1),.enable(enablex1),.o(x1r));
register #(11) x2 (.in(Rx2),.clk(clk),.clr(clrx2),.enable(enablex2),.o(x2r));
register #(11) x3 (.in(Rx3),.clk(clk),.clr(clrx3),.enable(enablex3),.o(x3r));
register #(11) y1 (.in(Ry1),.clk(clk),.clr(clry1),.enable(enabley1),.o(y1r));
register #(11) y2 (.in(Ry2),.clk(clk),.clr(clry2),.enable(enabley2),.o(y2r));
register #(11) y3 (.in(Ry3),.clk(clk),.clr(clry3),.enable(enabley3),.o(y3r));
endmodule




