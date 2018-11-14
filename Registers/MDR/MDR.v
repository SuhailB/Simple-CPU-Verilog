module MDR(clk, reset, R_W, in_bus_en, in_mem_en, out_bus_en, out_mem_en, data_bus, data_mem);
input clk, reset, R_W, in_bus_en, in_mem_en, out_bus_en, out_mem_en;
inout[15:0] data_bus;
inout[15:0] data_mem;

reg[15:0] register;


always@(posedge clk or posedge reset)
begin
  if(reset) register <= 0;
  else begin
    if(R_W) begin //read from memory
        if(in_mem_en) register <= data_mem;
    end
    else begin //write to memory
        if(in_bus_en)  register <= data_bus;
    end
  end
end

assign data_bus = out_bus_en? register: 16'hzzzz;
assign data_mem = out_mem_en? register: 16'hzzzz;

endmodule