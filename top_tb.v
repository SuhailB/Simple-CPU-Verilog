`timescale 1ns/1ps

module top_tb;

//inputs
reg reset;
reg clk;
reg start_move, start_movi, fetch;

top topTB(clk, reset, start_move, start_movi, fetch);

initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial

begin
fetch = 0;
start_move = 0;
start_movi = 0;
reset = 0; 
#5 reset = 1;
#5 reset = 0;
fetch = 1;
#10 fetch = 0;

#300 start_move = 1;
#10 start_move = 0;

#200 fetch  = 1;
#5 fetch = 0;

#150 start_movi = 1;
#4 start_movi = 0;


end

endmodule
