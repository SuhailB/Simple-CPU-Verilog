//module Port0(clk, reset, read, write, in_from_bus, out_to_bus, out); //read is for the tri state buffer
module Port0(clk, reset, in_from_bus, out_to_bus, read, write, out_pin); 

input clk, reset, read, write; //read means read from the bus, the out_pin is always out
input [15:0] in_from_bus;

output[15:0] out_to_bus;
output[15:0] out_pin;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(write) register <= in_from_bus; //write into output when write == 1
end

assign out_pin = register;
assign out_to_bus = read? register : 16'hzzzz; //read from output when read == 1

endmodule
