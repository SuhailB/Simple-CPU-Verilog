`timescale 1ns/1ps

module Store_tb;

reg clk, reset, start, MFC;
reg[5:0] Ri, Rj;
wire R0_read;
wire R1_read;
wire R2_read;
wire R3_read;
wire P0_read;
wire MAR_write, MAR_mem_read;
wire MEM_RW, MEM_EN;
wire MDR_mem_read, MDR_write;
wire done;

Store TB 
(
    clk, reset, start, MFC, Ri, Rj,
    R0_read,
    R1_read,
    R2_read,
    R3_read,
    P0_read,
    MAR_write, MAR_mem_read, 
    MEM_RW, MEM_EN, 
    MDR_mem_read, MDR_write, 
    done
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
  Ri = 6'hffffff;
  Rj = 0;
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
