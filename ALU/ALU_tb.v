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
reg reset;
reg clk;
reg[15:0] Bus_in;
reg IN1_en;
reg IN2_en;
reg OUT_en;
reg OUT_reg_en;
reg[2:0] OpControl;

//outputs
wire[15:0] Bus_out;

ALU ALU_c (reset, clk, Bus_in, IN1_en, IN2_en, OUT_en, OUT_reg_en, OpControl, Bus_out);

initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial

begin

    Bus_in = 16'h55;
    reset = 0;
    IN1_en = 0;
    IN2_en = 0;
    OUT_en = 0;
    OUT_reg_en = 0;
    OpControl = 0;
    #1
    reset = 1;
    #1
    reset = 0;
    IN1_en = 1;
    IN2_en = 1;
    OUT_en = 1;
    #10 OpControl = ADD;
    OUT_reg_en = 1;
    #10 OpControl = SUB;
    #10 OpControl = NOT;
    #10 OpControl = AND;
    #10 OpControl = OR;
    #10 OpControl = XOR;
    #10 OpControl = XNOR;
    #10 OpControl = 7;
    #10 OUT_en = 0;
    #10;
    $stop;
    
end

endmodule
