`timescale 1ns/1ns
module Port1_tb();
//bus_out means out to bus
reg clk, reset, read;
reg[15:0] in;

wire[15:0] bus_out;


Port1 TB(clk, reset, read, in, bus_out);


initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial begin

//as an output
read = 0;
reset = 0;
in = 0;
#3 reset = 1;
#3 reset = 0;
in = 9;
#10 read = 1;
#10 read = 0;



end
endmodule
