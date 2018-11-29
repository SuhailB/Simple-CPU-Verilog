//module R0(clk, reset, read, write, in_from_bus, out_to_bus);
module R1   (clk, reset, in_from_bus, out_to_bus, read, write);

input clk, reset, read, write;
input[15:0] in_from_bus;

output[15:0] out_to_bus;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(write) register <= in_from_bus;
end

assign out_to_bus = read? register : 16'hzzzz;

endmodule
