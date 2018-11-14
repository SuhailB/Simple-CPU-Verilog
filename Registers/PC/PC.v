module PC(clk, reset, inc, out_en, data_out);

input clk, reset, inc, out_en;

output[15:0] data_out;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(inc) register <= register + 1;
end

assign data_out = out_en? register : 16'hzzzz;

endmodule