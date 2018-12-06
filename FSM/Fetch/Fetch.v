module Fetch
(
    clk, reset, start, MFC,
    PC_read, PC_increment,
    MAR_write, MAR_mem_read, 
    MEM_RW, MEM_EN, 
    MDR_mem_write, MDR_read, 
    IR_write, done
);

input clk, reset, start, MFC;
output reg PC_read, PC_increment;
output reg MAR_write, MAR_mem_read; 
output reg MEM_RW, MEM_EN;
output reg MDR_mem_write, MDR_read; 
output reg IR_write;
output reg done;

reg[2:0] pres_state, next_state;
parameter  init = 0, st0 = 1, st1 = 2, st2 = 3, st3 = 4, WAIT1 = 5,  DONE = 6;

//FSM register
always @(posedge clk or posedge reset)
    begin:statereg
        if (reset)  pres_state <= init; 
        else        pres_state <= next_state;
    end //stateregFSM Description by VerilogExample

//FSM next state logic
always @(pres_state or MFC or start)
begin: fsm
    case (pres_state)

        init: if(start) next_state <= st0;
           
        st0: next_state <= st1;

        st1: next_state <= WAIT1;

        WAIT1: if(!MFC) next_state <= st2;
    
        st2: next_state <= st3;

        st3: next_state <= DONE;

        DONE: next_state <= init;

        default: next_state<= init;

    endcase end //fsm
//Moore output definition using pres_state only
always   @(pres_state)
begin: outputs
    case (pres_state)

        init: begin
            PC_read         <= 0;
            MAR_write       <= 0;
            MAR_mem_read    <= 0;
            MEM_RW          <= 0;
            MEM_EN          <= 0;
            MDR_mem_write   <= 0;
            MDR_read        <= 0;
            IR_write        <= 0;
            PC_increment    <= 0;
            done <= 0;
        end

        st0: begin
            PC_read         <= 1;
            MAR_write       <= 1;
            MAR_mem_read    <= 0;
            MEM_RW          <= 0;
            MEM_EN          <= 0;
            MDR_mem_write   <= 0;
            MDR_read        <= 0;
            IR_write        <= 0;
            PC_increment    <= 0;
        end

        st1: begin
            PC_read         <= 0;
            MAR_write       <= 0;
            MAR_mem_read    <= 1;
            MEM_RW          <= 1;
            MEM_EN          <= 1;
            MDR_mem_write   <= 0;
            MDR_read        <= 0;
            IR_write        <= 0;
            PC_increment    <= 0;
        end

        WAIT1: begin
            // PC_read         <= 0;
            // MAR_write       <= 0;
            // MAR_mem_read    <= 0;
            // MEM_RW          <= 0;
            // MEM_EN          <= 0;
            // MDR_mem_write   <= 0;
            // MDR_read        <= 0;
            // IR_write        <= 0;
            // PC_increment    <= 0;
        end

        st2: begin
            PC_read         <= 0;
            MAR_write       <= 0;
            MAR_mem_read    <= 0;
            MEM_RW          <= 0;
            MEM_EN          <= 0;
            MDR_mem_write   <= 1;
            MDR_read        <= 0;
            IR_write        <= 0;
            PC_increment    <= 0;
        end

        st3: begin
            PC_read         <= 0;
            MAR_write       <= 0;
            MAR_mem_read    <= 0;
            MEM_RW          <= 0;
            MEM_EN          <= 0;
            MDR_mem_write   <= 0;
            MDR_read        <= 1;
            IR_write        <= 1;
            
        end

        DONE: begin
            PC_read         <= 0;
            MAR_write       <= 0;
            MAR_mem_read    <= 0;
            MEM_RW          <= 0;
            MEM_EN          <= 0;
            MDR_mem_write   <= 0;
            MDR_read        <= 0;
            IR_write        <= 0;
            done <= 1;
            PC_increment    <= 1;
        end

    endcase 
end //fsm          

endmodule