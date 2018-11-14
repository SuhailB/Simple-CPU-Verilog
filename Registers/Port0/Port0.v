module Port0(clk, reset, read, write, data_bus, data_out); //read is for the tri state buffer

input clk, reset, read, write;

inout [15:0] data_bus;

output[15:0] data_out;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(write) register <= data_bus; //write into output when write == 1
end

assign data_out = register;
assign data_bus = read? register : 16'hzzzz; //read from output when read == 1

endmodule
