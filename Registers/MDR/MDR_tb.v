`timescale 1ns/1ns
module MDR_tb();

//inputs
reg clk;
reg reset;
reg in_bus_en, in_mem_en, out_bus_en, out_mem_en;
reg[15:0] bus_in;
reg[15:0] mem_in;

//outputs
wire[15:0] bus_out;
wire[15:0] mem_out;



MDR TB(clk, reset, in_bus_en, in_mem_en, out_bus_en, out_mem_en, bus_in, bus_out, mem_in, mem_out);


initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial begin

reset = 0;
in_bus_en = 0; in_mem_en = 0; out_bus_en = 0; out_mem_en = 0;
bus_in = 1;
mem_in = 15;
#1 reset = 1;
#1 reset = 0;
in_bus_en = 1;
#20
in_bus_en = 0;
in_mem_en = 1;
out_bus_en = 1;
out_mem_en = 1;
#20
in_bus_en = 0; in_mem_en = 0; out_bus_en = 0; out_mem_en = 0;
reset = 1;
#1 reset = 0;



end
endmodule
