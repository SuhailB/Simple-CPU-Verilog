`timescale 1ns/1ps

module top_tb;

//inputs
reg reset;
reg clk;

top topTB(clk, reset);

initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial

begin

reset = 0; 
#5 reset = 1;
#5 reset = 0;


end

endmodule
