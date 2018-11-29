`timescale 1ns/1ps

module Fetch_tb;

reg clk, reset, start, MFC;
wire PC_read;
wire MAR_write, MAR_mem_read; 
wire MEM_RW, MEM_EN;
wire MDR_mem_write, MDR_read; 
wire IR_write;


Fetch TB 
(
    clk, reset, start, MFC,
    PC_read, 
    MAR_write, MAR_mem_read, 
    MEM_RW, MEM_EN, 
    MDR_mem_write, MDR_read, 
    IR_write
);


initial // Clock generator
  begin
    clk = 1;
    forever #10 clk = !clk;
  end

initial

begin

  reset = 0;
  MFC = 1;
  start = 0;
  #1 reset = 1;
  #1 reset = 0;
  #20 start = 1;
  #10 start = 0;

  #100 MFC = 0;
  #1 MFC = 1;

  #100 start = 1;
  #5 start = 0;

  #200 MFC = 0;
    
end

endmodule
