`timescale 1ns/1ns
module MDR_tb();

reg clk;
reg reset;
reg R_W;
reg in_bus_en, in_mem_en, out_bus_en, out_mem_en;


reg [15:0] in1;
wire [15:0] data_bus;
wire  [15:0] out1;
reg isIn1;

reg [15:0] in2;
wire [15:0] data_mem;
wire  [15:0] out2;
reg isIn2;

MDR TB(clk, reset, R_W, in_bus_en, in_mem_en, out_bus_en, out_mem_en, data_bus, data_mem);

assign out1 = data_bus;
assign data_bus = isIn1? in1 : 16'hzzzz;


assign out2 = data_mem;
assign data_mem = isIn2? in2 : 16'hzzzz;



initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial begin


reset = 0;

isIn1 = 0;
isIn2 = 1;

R_W = 0;
in_bus_en = 0;
in_mem_en = 0;
out_bus_en = 0;
out_mem_en = 0;
in2 = 16'hffff;
#10
reset = 1;
#10
reset = 0;
R_W = 1;
#20
in_mem_en = 1;
#10
out_bus_en = 1;

end
endmodule
