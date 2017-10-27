`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2017 09:26:47
// Design Name: 
// Module Name: controller
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


module controller(start,clk,reset,cycle);

//Parâmetros da máquina de estado
input reg start,clk,reset;
input reg [5:0] cycle;
//Parâmetros de controle do  datapath
//reg [10:0] Rx1,Rx2,Rx3,Ry1,Ry2,Ry3;
reg  selmul3_1,selmul3_2,seladd5_2,seladd5_1,selr7,selsqrt,clr1,clr2,clr3,clr4,clr5,clr6,clr7,clr8,clr9,clr10,clr11,enable1,enable2,enable3,enable4,enable5,enable6,enable7,enable8,enable9,enable10,enable11;
reg  clrx1,clrx2,clrx3,clry1,clry2,clry3,enablex1,enablex2,enablex3,enabley1,enabley2,enabley3;
reg [1:0] selmul2_2,selmul2_1,selmul1_2,selmul1_1,seladd2_2,seladd1_1,seldiv_2,seldiv_1,selr11,selr10,selr9,selr8,selr6,selr4,selr3,selr2,selr1;
reg[2:0] seladd4_2,seladd4_1,seladd3_2,seladd3_1,seladd2_1,seladd1_2;
reg [1:0] opadd1,opadd2,opadd3,opadd4,opadd5;
 
//reg [1:0] opadd1,opadd2,opadd3,opadd4,opadd5;
Datapath data1 (.selmul3_1(selmul3_1),.selmul3_2(selmul3_2),.seladd5_2(seladd5_2),.seladd5_1(seladd5_1),.selr7(selr7),.selsqrt(selsqrt),.selmul2_2(selmul2_2),.selmul2_1(selmul2_1),.selmul1_2(selmul1_2),.selmul1_1(selmul1_1),.seladd2_2(seladd2_2),.seladd1_1(seladd1_1),.seldiv_2(seldiv_2),.seldiv_1(seldiv_1),.selr11(selr11),.selr10(selr10),.selr9(selr9),.selr8(selr8),.selr6(selr6),.selr4(selr4),.selr3(selr3),.selr2(selr2),.selr1(selr1),
.seladd4_2(seladd4_2),.seladd4_1(seladd4_1),.seladd3_2(seladd3_2),.seladd3_1(seladd3_1),.seladd2_1(seladd2_1),.seladd1_2(seladd1_2),.clk(clk),.clr1(clr1),.clr2(clr2),.clr3(clr3),.clr4(clr4),.clr5(clr5),.clr6(clr6),.clr7(clr7),.clr8(clr8),.clr9(clr9),.clr10(clr10),.clr11(clr11),.enable1(enable1),.enable2(enable2),.enable3(enable3),.enable4(enable4),.enable5(enable5),.enable6(enable6),.enable7(enable7),.enable8(enable8),.enable9(enable9),.enable10(enable10),.enable11(enable11), .opadd1(opadd1),.opadd2(opadd2),.opadd3(opadd3),.opadd4(opadd4),.opadd5(opadd5),.start(start),.clrx1(clrx1),.clrx2(clrx2),.clrx3(clrx3),.clry1(clry1),.clry2(clry2),.clry3(clry3),.enablex1(enablex1),.enablex2(enablex2),.enablex3(enablex3),.enabley1(enabley1),.enabley2(enabley2),.enabley3(enabley3)
);

always @(*)           
    begin
        case(cycle)
            6'b0:
                begin
                 /* Rx1=40;
                    Rx2=20;
                    Rx3=10;
                    Ry1=50;
                    Ry2=60;
                    Ry3=100;*/           
                    enablex1=1;
                    enablex2=1;
                    enablex3=1;
                    enabley1=1;
                    enabley2=1;
                    enabley3=1;
                end
            6'b000001:
                begin
                    //ax1//
                                                               
                    //add
                     seladd1_2=3'b100;
                     seladd1_1=2'b11;
                     opadd1=2'b00;
                    //register
                     selr1=2'b10;
                     clr1=0;
                     enable1=1;
                     
                     //ay1//
                    
                     //add
                     seladd2_2=2'b11;
                     seladd2_1=3'b100;
                     opadd2=2'b0;
                    //register
                     selr7=2'b01;
                     clr7=0;
                     enable7=1;
            
                     //mx1//
                     
                     //mult
                     selmul1_1=2'b10;
                     selmul1_2=2'b10;
                     //register
                     selr2=2'b10;
                     clr2=0;
                     enable2=1;
                     
                     //mx2//
                     
                     //mult
                     selmul2_1=2'b10;
                     selmul2_2=2'b10;
                     //register
                     selr3=2'b10;
                     clr3=0;
                     enable3=1;
                     
                     //mx3//
                        
                    //mult
                     selmul3_1=1'b1;
                     selmul3_2=1'b1;
                    //register
                     selr4=2'b10;
                     clr4=0;
                     enable4=1;
    
                end
            6'b000010:
                begin
                    //Mx//
                                                            
                    //add
                    seladd1_2=3'b011;
                    seladd1_1=2'b10;
                    opadd1=2'b01;
                    //register
                    clr1=0;
                    enable1=1;
                    selr1=2'b10;
                      
                    //My//
                    
                    //add
                    seladd3_2=3'b101;
                    seladd3_1=3'b100;
                    opadd3=2'b01;
                    //register
                    clr1=0;
                    enable1=1;
                    selr7=1;
                                        
                    //amx1//
                    
                    //add
                    seladd2_2=2'b10;
                    seladd2_1=3'b011;
                    opadd2=2'b00;
                    //register
                    clr2=0;
                    enable2=1;
                    selr2=2'b00;
                    
                    //my1//
                    
                    //mult
                    selmul1_1=2'b01;
                    selmul1_2=2'b01;
                    //register
                    clr8=0;
                    enable8=1;
                    selr8=2'b10;
                    
                    
                    //my2//
                    
                    //mult
                    selmul2_1=2'b01;
                    selmul2_2=2'b01;
                    //register
                    clr9=0;
                    enable9=1;                 
                    selr9=2'b10;
                    
                    //my3//
                    
                    //mult
                    selmul3_1=0;
                    selmul3_2=0;
                    //register
                    clr10=0;
                    enable10=1;
                    selr10=2'b11;
                                        
                end
            6'b000011:
                begin
                    //Mx²
                    
                    //mult
                    selmul1_2=2'b00;
                    selmul1_1=2'b00;
                    //register
                    enable4=1;
                    selr4=2'b01;
                    
                    //amy1
                  
                    //add
                    seladd2_2=2'b01;
                    seladd2_1=3'b010;
                    opadd2=0;
                    //register
                    selr8=2'b01;
                    clr8=0;
                    enable8=1;
                    
                    
                    //N1
                    
                    //add
                    seladd4_2=3'b100;
                    seladd4_1=2'b11;
                    opadd4=1;
                    //register
                    selr8=2'b01;
                    clr8=0;
                    enable8=1;
                     
                    //Mx2
                    
                    //add
                    seladd1_2=3'b010;
                    seladd1_1=2'b10;
                    opadd1=0;
                    //register 
                    selr6=2'b10;
                    clr6=0;
                    enable6=1;
                    
                    //My²
                    
                    //mult
                    selmul2_2=2'b00;
                    selmul2_1=2'b00;
                    //register
                    selr9=2'b10;
                    clr9=0;
                    enable9=1;
                end
            6'b000100:
                begin
                    //Vx
                    
                    //add
                    seladd3_2=3'b100;
                    seladd3_1=3'b011;
                    opadd3=2'b10;
                    //register
                    selr3=2'b01;
                    clr3=0;
                    enable3=1;
                    
                    //N2
                    seladd4_2=3'b011;
                    seladd4_1=2'b10;
                    opadd4=10;
                    
                    //register
                    selr4=2'b10;
                    clr4=0;
                    enable4=1;
                    
                    //My²
                    seladd3_2=3'b011;
                    seladd3_1=3'b010;
                    opadd3=0;
                    //register
                    selr9=2'b00;
                    clr9=0;
                    enable9=1;
                end
            6'b000101:
                begin
                    //SDx
                    
                    //sqrt
                    selsqrt=1;
                    
                    //register
                    selr6=2'b00;
                    clr6=0;
                    enable6=0;
                    
                    //N3
                    
                    //add
                    seladd4_2=3'b010;
                    seladd4_1=2'b01;
                    opadd4=2'b10;
                    
                    //register
                    selr3=2'b00;
                    clr3=0;
                    enable3=0;
                    
                    //Vy
                    
                    //add
                    seladd3_2=3'b011;
                    seladd3_1=3'b010;
                    opadd3=2'b10;
           
                    //register
                    selr9=2'b00;
                    clr9=0;
                    enable9=0;
  
                end
            6'b000110:
                begin
                    //SDy
                    
                    //sqrt
                    selsqrt=0;
                    
                    //register
                    selr9=2'b01;
                    clr9=0;
                    enable9=1;                                     
                end
            6'b001101:
                begin
                    //MSDx
                    
                    //add
                    seladd2_2=2'b00;
                    seladd2_1=3'b001; 
                    opadd2=2'b10;
                    
                    //register
                    selr2=2'b0;
                    clr2=0;
                    enable2=1;
                end
            6'b001110:
                begin
                    //DX1
                    
                    //add
                    seladd1_2=3'b100;
                    seladd1_1=2'b01;
                    opadd1=2'b10;
                    
                    //register
                    selr1=2'b10;
                    clr1=0;
                    enable1=0;
                    
                    //DX2
                    
                    //add
                    seladd3_2=3'b010;
                    seladd3_1=3'b001;
                    opadd1=2'b10;
                    
                    //register
                    selr2=2'b01;
                    clr2=0;
                    enable2=0;
                    
                    //DX3
                    
                    //add
                    seladd4_2=3'b001;
                    seladd4_1=2'b01;
                    opadd1=2'b01;
                    
                    //register
                    selr6=2'b01;
                    clr2=0;
                    enable2=0;
                  
                end
            6'b001111:
                begin
                    //DY1
                    
                    //add
                    seladd1_2=3'b000;
                    seladd1_1=2'b00;
                    opadd1=2'b10;
                    
                    //register
                    selr8=2'b00;
                    clr8=0;
                    enable8=1;
                    
                    //DY2
                    
                    //add
                    seladd1_2=3'b011;
                    seladd1_1=3'b000;
                    opadd1=2'b10;
                    
                    //register
                    selr9=2'b00;
                    clr9=0;
                    enable9=1;
                    
                    //DY3
                    
                    //add
                    seladd4_2=3'b011;
                    seladd4_1=2'b00;
                    opadd1=2'b10;
                    
                    //register
                    selr10=2'b01;
                    clr10=0;
                    enable10=0;
                         
                end
            6'b010000:
                begin
                    //D1
                    
                    //add
                    seladd4_2=3'b0;
                    seladd4_1=2'b0;
                    opadd4=2'b0;
                    
                    //register
                    selr1=2'b00;
                    clr1=0;
                    enable1=1;
                    
                    //D2
                    
                    //add
                    seladd2_2=2'b01;
                    seladd2_1=3'b011;
                    opadd2=2'b0;
                    
                    //register
                    selr6=2'b11;
                    clr6=0;
                    enable6=1;
                    
                    //D3
                    
                    //add
                    seladd3_2=3'b000;
                    seladd3_1=3'b011;
                    opadd4=0;
                    
                    //register
                    selr10=2'b00;
                    clr10=0;
                    enable10=1;
               
                end 
            6'b010001:
                begin
                    //Q1
                    
                    //div
                    seldiv_2=2'b10;
                    seldiv_1=2'b10;
                    
                    
                end
             6'b010010:
                begin
                    //Q2
                 
                    //div
                    seldiv_2=2'b01;
                    seldiv_1=2'b01;
                     
                 
                end
            6'b010011:
                begin
                    //Q3
         
                    //div
                    seldiv_2=2'b10;
                    seldiv_1=2'b10;
                                  
                end
            6'b100110:
                begin
                    //register
                    selr11=2'b10;
                    clr11=0;
                    enable11=1;          
                end
            6'b100111:
                begin
                    //aQ1 
                    
                    //add
                    seladd5_2=1;
                    seladd5_1=1;
                    opadd5=2'b00;
                   
                    //register
                    selr11=2'b00;
                    clr11=0;
                    enable11=1;
                    
                end
            6'b101000:
                begin
                    
                    //aQ2
                    seladd5_2=1;
                    seladd5_1=1;
                    opadd5=2'b10;            
                end
            6'b101001:
                begin
                end
            6'b101010:
                begin   
                end         
        endcase
    end
always@(posedge clk, negedge reset)
    
        if(~reset)
            cycle <= 6'b0; 
        else   
            case(cycle)
            6'b0:
               cycle <= 6'b000001;
            6'b000001:
               cycle <= 6'b000010;
            6'b000010:
               cycle <= 6'b000011;
            6'b000011:   
               cycle <= 6'b000100;
            6'b000100:
               cycle <= 6'b000101;
            6'b000101:
               cycle <= 6'b000110;
            6'b000110:
               cycle <= 6'b001101;
            6'b001101:
               cycle <= 6'b001110;
            6'b001110:
               cycle <= 6'b001111;
            6'b001111:
               cycle <= 6'b010000;
            6'b010000: 
               cycle <= 6'b010001;
            6'b010001:
               cycle <= 6'b010010;
            6'b010010:
               cycle <= 6'b010011;
           6'b010011:
               cycle <= 6'b100111;
            6'b100111:    
               cycle <= 6'b101000;
            6'b101000:            
               cycle <= 6'b101001;
            6'b101001:
               cycle <= 6'b101010;
            6'b101010:
               cycle <= 6'b00000;
 
            endcase
         
endmodule
