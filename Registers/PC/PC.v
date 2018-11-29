//module PC(clk, reset, increment, read, out_to_bus);
module PC   (clk, reset,              out_to_bus, read,        increment);

input clk, reset, increment, read;

output[15:0] out_to_bus;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(increment) register <= register + 1;
end

assign out_to_bus = read? register : 16'hzzzz;

endmodule