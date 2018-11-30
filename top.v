`include "/FSM/Fetch/Fetch.v"
`include "/FSM/Move/Move.v"
`include "/FSM/Movi/Movi.v"
`include "/FSM/ALU_FSM/ALU_FSM.v"
`include "/FSM/ALUI_FSM/ALUI_FSM.v"
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
`include "/ALU/ALU_pre.v"
`include "/Registers/Port0/Port0.v"

module top(clk, reset);

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
wire move_done, movi_done, ALU_done, ALUI_done;
wire start_fetch, start_move, start_movi, start_ALU, start_ALUI;

wire R0_write, R0_read;
wire R1_write, R1_read;
wire R2_write, R2_read;
wire R3_write, R3_read;
wire P0_write, P0_read;
wire decode_done, fetch_done;

wire ALU_read;
wire[2:0] opControl;

wire[5:0] Ri, Rj;
wire[3:0] opCode;

wire[2:0] ALU_opControl, ALUI_opControl;

assign Rj = out_to_decoder[5:0];
assign Ri = out_to_decoder[11:6];
assign opCode = out_to_decoder[15:12];


assign start_fetch = reset || move_done || movi_done || ALU_done || ALUI_done;

Decoder Decoder_comp(fetch_done, opCode, start_move, start_movi, start_ALU, start_ALUI);

Fetch Fetch_comp
(
    clk, reset, start_fetch, MFC,
    PC_read, PC_increment,
    MAR_write, MAR_mem_read, 
    MEM_RW, MEM_EN, 
    MDR_mem_write, MDR_read, 
    IR_write, fetch_done
);

Move Move_comp
(
    clk, reset, start_move, Ri, Rj, 
    move_done,
    R0_write_move, R0_read_move,
    R1_write_move, R1_read_move,
    R2_write_move, R2_read_move,
    R3_write_move, R3_read_move,
    P0_write_move, P0_read_move
);

Movi Movi_comp
(
    clk, reset, start_movi, Ri, Rj, 
    bus,
    movi_done,
    R0_write_movi,
    R1_write_movi,
    R2_write_movi,
    R3_write_movi,
    P0_write_movi
);

ALU_FSM ALU_FSM_comp
(
    clk, reset, start_ALU, opCode, Ri, Rj, 
    ALU_done,
    R0_write_ALU, R0_read_ALU,
    R1_write_ALU, R1_read_ALU,
    R2_write_ALU, R2_read_ALU,
    R3_write_ALU, R3_read_ALU,
    P0_write_ALU, P0_read_ALU,
    ALU_opControl,
    ALU_alu_out_en, ALU_writeIN1, ALU_writeIN2, ALU_read
);

ALUI_FSM ALUI_FSM_comp
(
    clk, reset, start_ALUI, opCode, Ri, Rj, 
    bus,
    ALUI_done,
    R0_write_ALUI, R0_read_ALUI,
    R1_write_ALUI, R1_read_ALUI,
    R2_write_ALUI, R2_read_ALUI,
    R3_write_ALUI, R3_read_ALUI,
    P0_write_ALUI, P0_read_ALUI,
    ALUI_opControl,
    ALUI_alu_out_en, ALUI_writeIN1, ALUI_writeIN2, ALUI_read
);

assign R0_read = R0_read_move || R0_read_ALU || R0_read_ALUI;
assign R1_read = R1_read_move || R1_read_ALU || R1_read_ALUI;
assign R2_read = R2_read_move || R2_read_ALU || R2_read_ALUI;
assign R3_read = R3_read_move || R3_read_ALU || R3_read_ALUI;
assign P0_read = P0_read_move || P0_read_ALU || P0_read_ALUI;

assign R0_write = R0_write_move || R0_write_movi || R0_write_ALU || R0_write_ALUI;
assign R1_write = R1_write_move || R1_write_movi || R1_write_ALU || R1_write_ALUI;
assign R2_write = R2_write_move || R2_write_movi || R2_write_ALU || R2_write_ALUI;
assign R3_write = R3_write_move || R3_write_movi || R3_write_ALU || R3_write_ALUI;
assign P0_write = P0_write_move || P0_write_movi || P0_write_ALU || P0_write_ALUI;

assign read_ALU = ALU_read || ALUI_read;
assign writeIN1 = ALU_writeIN1 || ALUI_writeIN1;
assign writeIN2 = ALU_writeIN2 || ALUI_writeIN2;
assign alu_out_en = ALU_alu_out_en || ALUI_alu_out_en;
assign opControl = ALU_opControl | ALUI_opControl;

ALU ALU_comp (clk, reset, bus, bus, read_ALU, writeIN1, writeIN2, alu_out_en, opControl);

R0 R0_comp   (clk, reset, bus, bus, R0_read, R0_write);
R1 R1_comp   (clk, reset, bus, bus, R1_read, R1_write);
R2 R2_comp   (clk, reset, bus, bus, R2_read, R2_write);
R3 R3_comp   (clk, reset, bus, bus, R3_read, R3_write);
Port0 P0_comp(clk, reset, bus, bus, P0_read, P0_write, out_pin); 

PC PC_comp   (clk, reset, bus, PC_read, PC_increment);
MAR MAR_comp (clk, reset, bus, MAR_to_MEM, MAR_write, MAR_mem_read); 

MEM MEM_comp (MEM_to_MDR, MFC, MEM_EN, MAR_to_MEM, MDR_to_MEM, MEM_RW);  

MDR MDR_comp (clk, reset, bus, bus, MDR_read, 0, MEM_to_MDR, MDR_to_MEM, mem_read, MDR_mem_write);
IR IR_comp   (clk, reset, bus, out_to_decoder, IR_write, 1); 


endmodule