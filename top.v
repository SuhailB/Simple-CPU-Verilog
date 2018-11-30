`include "/FSM/Fetch/Fetch.v"
`include "/FSM/Move/Move.v"
`include "/FSM/Movi/Movi.v"
`include "/Registers/PC/PC.v"
`include "/Registers/MAR/MAR.v"
`include "/Registers/MDR/MDR.v"
`include "MEM.v"
`include "/Registers/IR/IR.v"
`include "/Registers/RegisterFile/R0.v"
`include "/Registers/RegisterFile/R1.v"
`include "/Registers/RegisterFile/R2.v"
`include "/Registers/RegisterFile/R3.v"
`include "/Decoder/Decoder.v"

module top(clk, reset, start_move, start_movi, fetch);

input clk, reset;

wire[15:0] bus;

wire[15:0] MAR_to_MEM;
wire[15:0] MDR_to_MEM;
wire[15:0] MEM_to_MDR;

wire MFC;
wire PC_read, PC_increment;
wire MAR_write, MAR_mem_read; 
wire MEM_RW, MEM_EN;
wire MDR_mem_write, MDR_read; 
wire IR_write;
wire[15:0] out_to_decoder;
wire move_done, movi_done;
input start_move, start_movi, fetch;

wire R0_write, R0_read;
wire R1_write, R1_read;
wire R2_write, R2_read;
wire R3_write, R3_read;
wire decode_done, fetch_done;

//assign fetch = reset || move_done || movi_done;

//Decoder Decoder_comp(fetch_done, out_to_decoder[15:12], start_move, start_movi);

Fetch Fetch_comp
(
    clk, reset, fetch, MFC,
    PC_read, PC_increment,
    MAR_write, MAR_mem_read, 
    MEM_RW, MEM_EN, 
    MDR_mem_write, MDR_read, 
    IR_write, fetch_done
);

Move Move_comp
(
    clk, reset, start_move, 0, 2, 
    move_done,
    R0_write_move, R0_read_move,
    R1_write_move, R1_read_move,
    R2_write_move, R2_read_move,
    R3_write_move, R3_read_move
);

Movi Movi_comp
(
    clk, reset, start_movi, 3, 6'b111111, 
    bus,
    movi_done,
    R0_write_movi,
    R1_write_movi,
    R2_write_movi,
    R3_write_movi
);

assign R0_read = R0_read_move;
assign R1_read = R1_read_move;
assign R2_read = R2_read_move;
assign R3_read = R3_read_move;

assign R0_write = R0_write_move || R0_write_movi;
assign R1_write = R1_write_move || R1_write_movi;
assign R2_write = R2_write_move || R2_write_movi;
assign R3_write = R3_write_move || R3_write_movi;



R0 R0_comp  (clk, reset, bus, bus, R0_read, R0_write);
R1 R1_comp  (clk, reset, bus, bus, R1_read, R1_write);
R2 R2_comp  (clk, reset, bus, bus, R2_read, R2_write);
R3 R3_comp  (clk, reset, bus, bus, R3_read, R3_write);

PC PC_comp   (clk, reset, bus, PC_read, PC_increment);
MAR MAR_comp (clk, reset, bus, MAR_to_MEM, MAR_write, MAR_mem_read); 

MEM MEM_comp (MEM_to_MDR, MFC, MEM_EN, MAR_to_MEM, MDR_to_MEM, MEM_RW);  

MDR MDR_comp (clk, reset, bus, bus, MDR_read, 0, MEM_to_MDR, MDR_to_MEM, mem_read, MDR_mem_write);
IR IR_comp   (clk, reset, bus, out_to_decoder, IR_write, 1); 


endmodule