
`timescale 1ns/1ns
module PC_tb();

reg clk, reset, inc, out_en;

wire[15:0] data_out;

PC TB(clk, reset, inc, out_en, data_out);

initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial begin


reset = 0;
inc = 0;
out_en = 0;
#10
reset = 1;
#10
reset = 0;
out_en = 1;
#10
inc = 1;
#20 inc =0;



end
endmodule
