`timescale 1ns/1ps

module Movi_tb;

reg clk, reset, start;
reg[5:0] Ri, num;

wire R0_write;
wire R1_write;
wire R2_write;
wire R3_write;
wire[15:0] out_to_bus;


Movi TB 
(
    clk, reset, start, Ri, num, 
    out_to_bus,
    start_next_I,
    R0_write,
    R1_write,
    R2_write,
    R3_write
);


initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial

begin

    Ri = 0;
    num = 15;
    start = 0;
    reset = 0;
    #1 reset = 1;
    #1 reset = 0;
    #20 start = 1;
    #4 start = 0;

end

endmodule
