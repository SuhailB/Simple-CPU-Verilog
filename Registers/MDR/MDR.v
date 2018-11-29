//module MDR(clk, reset, write, mem_write, read, mem_read, in_from_bus, out_to_bus, in_from_mem, out_to_mem);
module MDR  (clk, reset, in_from_bus, out_to_bus, read, write, in_from_mem, out_to_mem, mem_read, mem_write);

input clk, reset, write, mem_write, read, mem_read;
input[15:0] in_from_bus;
input[15:0] in_from_mem;

output[15:0] out_to_bus;
output[15:0] out_to_mem;


reg[15:0] register;


always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else begin//should make sure that one of them is enabled at a time
        if(write && !mem_write) register <= in_from_bus;
        if(mem_write && !write) register <= in_from_mem;
  end
end

assign out_to_bus = read? register: 16'hzzzz;
assign out_to_mem = mem_read? register: 16'hzzzz;

endmodule