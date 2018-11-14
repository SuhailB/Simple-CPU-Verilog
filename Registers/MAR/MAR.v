module MAR(clk, reset, in_en, out_en, data_in, data_out);
input clk, reset, in_en, out_en;
input [15:0] data_in;
output[15:0] data_out;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(in_en) register <= data_in;
end

assign data_out = out_en? register : 16'hzzzz;

endmodule