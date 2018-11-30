//module MAR(clk, reset, write, read, in_from_bus, out_to_mem); //read is not necessary
module MAR  (clk, reset, in_from_bus, out_to_mem, write, mem_read); 

input clk, reset, write, mem_read;
input [15:0] in_from_bus;
output[15:0] out_to_mem;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(write) register <= in_from_bus;
end

assign out_to_mem = mem_read? register : 16'hzzzz;

endmodule