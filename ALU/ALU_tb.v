`timescale 1ns/1ps

module ALU_tb;

//parameters
parameter ADD  = 0;
parameter SUB  = 1;
parameter NOT  = 2;
parameter AND  = 3;
parameter OR   = 4;
parameter XOR  = 5;
parameter XNOR = 6;

//inputs
reg[5:0] IN1_i;
reg[5:0] IN2_i;
reg IN1_en;
reg IN2_en;
reg OUT_EN;
reg[2:0] OpControl;

//outputs
wire[5:0] OUT;

ALU ALU_c (IN1_i, IN2_i, IN1_en, IN2_en, OUT, OUT_EN, OpControl);

initial

begin
    IN1_i = 6'h55;
    IN2_i = 6'hAA;
    IN1_en = 1;
    IN2_en = 1;
    OUT_EN = 0;
    OpControl = 8;
    #10 OUT_EN = 1;
    #10 OpControl = ADD;
    #10 OpControl = SUB;
    #10 OpControl = NOT;
    #10 OpControl = AND;
   
    #10 OpControl = OR;
    #10 OpControl = XOR;
    #10 OpControl = XNOR;
    #10 OpControl = 7;
    #10 OUT_EN = 0;
    #10;
    $stop;
    
end

endmodule
