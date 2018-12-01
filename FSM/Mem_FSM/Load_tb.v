`timescale 1ns/1ps

module Load_tb;

reg clk, reset, start, MFC;
reg[5:0] Ri, Rj;
wire R0_read, R0_write;
wire R1_read, R1_write;
wire R2_read, R2_write;
wire R3_read, R3_write;
wire P0_read, P0_write;
wire MAR_write, MAR_mem_read;
wire MEM_RW, MEM_EN;
wire MDR_mem_write, MDR_read;
wire done;

Load TB 
(
    clk, reset, start, MFC, Ri, Rj,
    R0_read, R0_write,
    R1_read, R1_write,
    R2_read, R2_write,
    R3_read, R3_write,
    P0_read, P0_write,
    MAR_write, MAR_mem_read, 
    MEM_RW, MEM_EN, 
    MDR_mem_write, MDR_read, 
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
