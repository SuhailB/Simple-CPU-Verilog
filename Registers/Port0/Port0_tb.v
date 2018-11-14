`timescale 1ns/1ns
module Port0_tb();

reg clk, reset, read, write;

reg  [15:0] in;
reg isIn;
wire [15:0] data_bus;
wire [15:0] out;

wire[15:0] data_out;

Port0 TB(clk, reset, read, write, data_bus, data_out);

assign out = data_bus;
assign data_bus = isIn? in : 16'hzzzz;

initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial begin

//as an output
in = 1;

isIn = 0;

read = 0;
write = 0;

reset = 0;
#10 reset = 1;
#10 reset = 0;

#30
read = 1;
write = 0;
#30
read = 0;
write = 1;
#30
read = 1;
write = 1;

isIn = 1;
#30
read = 0;
write = 0;
#30
read = 1;
write = 0;
#30
read = 0;
write = 1;
#30
read = 1;
write = 1;



end
endmodule
