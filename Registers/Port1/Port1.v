module Port1(clk, reset, read, data_out);

input clk, reset, read, write;
input[15:0] data_in;

output[15:0] data_out;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(write) register <= data_in;
end

assign data_out = read? register : 16'hzzzz;

endmodule
