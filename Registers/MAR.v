module MAR(clk, reset, in_en, out_en, data_i, data_o);
input clk, reset, in_en, out_en;
input [15:0] data_i;
output reg[15:0] data_o;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(in_en) register <= data_i;
  else if(out_en) data_out <= register;
end

endmodule