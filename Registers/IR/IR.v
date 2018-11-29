//module IR(clk, reset, write, FSM_read, in_from_bus, out_to_bus); //FSM_read is not necessary
module IR   (clk, reset, in_from_bus, out_to_bus,       write, FSM_read); 

input clk, reset, write, FSM_read;
input [15:0] in_from_bus;
output[15:0] out_to_bus;

reg[15:0] register;

always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else if(write) register <= in_from_bus;
end

//I may not need the FSM_read
assign out_to_bus = FSM_read? register : 16'hzzzz;

endmodule