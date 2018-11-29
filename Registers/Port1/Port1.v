//module Port1(clk, reset, read, in, out_to_bus);
module Port1(clk, reset,              out_to_bus, read,        in_pin);

input clk, reset, read;
input[15:0] in_pin;

output[15:0] out_to_bus;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else register <= in_pin;
end

assign out_to_bus = read? register : 16'hzzzz;

endmodule
