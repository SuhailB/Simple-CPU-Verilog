`timescale 1ns/1ns
module R_tb();

reg clk, reset, read, write;
reg[15:0] bus_in;

wire[15:0] bus_out;
wire[15:0] out;

R0 TB(clk, reset, read, write, bus_in, bus_out);


initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial begin

reset = 0;
read = 0;
write = 0;
bus_in = 0;
#10 reset = 1;
#3 reset = 0;
read = 1;
#15
bus_in = 15;
write = 1;



end
endmodule
