`timescale 1ns/1ps

module top_tb;

//inputs
reg clk, reset, input_enable;
reg[15:0] input_pin;
wire[15:0] output_pin;

top topTB(clk, reset, input_pin, output_pin, input_enable);

initial // Clock generator
  begin
    clk = 0;
    forever #50 clk = !clk;
  end

initial

begin

input_enable = 0;
input_pin = 16'hf0f0;
reset = 0; 
#5 reset = 1;
#5 reset = 0;

#10000

input_enable = 1;



end

endmodule
