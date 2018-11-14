`timescale 1ns/1ns
module MAR_tb();

reg clk;
reg reset;
reg in_en;
reg out_en;
reg[15:0] data_in;
wire[15:0] data_out;

MAR TB(clk, reset, in_en, out_en, data_in, data_out);


initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial
begin
   reset = 0;
   in_en = 0;
   out_en = 0;
   data_in = 16'hFFFF;
   out_en = 0;
#5 reset = 1;
#5 reset = 0;
#10 out_en = 1;
    in_en = 1;
#10 out_en = 0;

end
endmodule
