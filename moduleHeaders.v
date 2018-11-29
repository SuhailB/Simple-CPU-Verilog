module ALU  (reset, clk, Bus_in, IN1_en, IN2_en, OUT_en, OUT_reg_en, OpControl, Bus_out);
module MAR  (clk, reset, in_en, out_en, data_in, data_out); //out_en is not necessary
module MDR  (clk, reset, in_bus_en, in_mem_en, out_bus_en, out_mem_en, bus_in, bus_out, mem_in, mem_out);
module PC   (clk, reset, inc, out_en, data_out);
module Port0(clk, reset, read, write, bus_in, bus_out, out); //read is for the tri state buffer
module Port1(clk, reset, read, in, bus_out);
module R0   (clk, reset, read, write, bus_in, bus_out);
module R1   (clk, reset, read, write, bus_in, bus_out);
module R2   (clk, reset, read, write, bus_in, bus_out);
module R3   (clk, reset, read, write, bus_in, bus_out);
module IR   (clk, reset, in_en, out_en, data_in, data_out); //out_en is not necessary

these components are the object (slaves) Memory and bus are masters

module ALU  (clk, reset, in_from_bus, out_to_bus, read, writeIN1, writeIN2, alu_out_en, OpControl);
module MAR  (clk, reset, in_from_bus, out_to_bus,       write, mem_read); 
module MDR  (clk, reset, in_from_bus, out_to_bus, read, write, in_from_mem, out_to_mem, mem_read, mem_write);
module R0   (clk, reset, in_from_bus, out_to_bus, read, write);
module R1   (clk, reset, in_from_bus, out_to_bus, read, write);
module R2   (clk, reset, in_from_bus, out_to_bus, read, write);
module R3   (clk, reset, in_from_bus, out_to_bus, read, write);
module IR   (clk, reset, in_from_bus, out_to_bus,       write, FSM_read); 
module Port0(clk, reset, in_from_bus, out_to_bus, read, write, out_pin); 
module Port1(clk, reset,              out_to_bus, read,        in_pin);
module PC   (clk, reset,              out_to_bus, read,        increment);
module MEM(Dataout, MFC, EN, addr, datain, RW); 