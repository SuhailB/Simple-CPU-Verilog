module Load
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

input clk, reset, start, MFC;
input[5:0] Ri, Rj;

output reg R0_read, R0_write;
output reg R1_read, R1_write;
output reg R2_read, R2_write;
output reg R3_read, R3_write;
output reg P0_read, P0_write;
output reg MAR_write, MAR_mem_read;
output reg MEM_RW, MEM_EN;
output reg MDR_mem_write, MDR_read;
output reg done;


reg[2:0] pres_state, next_state;
parameter  st0 = 0, st1 = 1, st2 = 2, st3 = 3, WAIT1 = 4, init = 5, DONE = 6;

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

        init: begin
            if(start) next_state <= st0;
            else next_state <= init;
        end

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
            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            MAR_write       <= 0; MAR_mem_read  <= 0;
            MEM_RW          <= 0; MEM_EN       <= 0;
                                  MDR_mem_write <= 0; 
            MDR_read        <= 0; 
            done <= 0;
        end

        st0: begin

            R0_write <= 0;
            R1_write <= 0;
            R2_write <= 0;
            R3_write <= 0;
            P0_write <= 0;

            case(Ri)

                0: R0_read <= 1;
                1: R1_read <= 1;
                2: R2_read <= 1;
                3: R3_read <= 1;
                4: P0_read <= 1;

            endcase

            MAR_write       <= 1; MAR_mem_read  <= 0;
            MEM_RW          <= 0; MEM_EN        <= 0;
                                  MDR_mem_write <= 0; 
            MDR_read        <= 0; 

            end

        st1: begin

            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            MAR_write       <= 0; MAR_mem_read  <= 1;
            MEM_RW          <= 1; MEM_EN        <= 1;
                                  MDR_mem_write <= 0; 
            MDR_read        <= 0; 

        end

        WAIT1: begin

            // R0_write <= 0; R0_read <= 0;
            // R1_write <= 0; R1_read <= 0;
            // R2_write <= 0; R2_read <= 0;
            // R3_write <= 0; R3_read <= 0;
            // P0_write <= 0; P0_read <= 0;
            // MAR_write       <= 0; MAR_mem_read  <= 0;
            // MEM_RW          <= 0; MEM_EN        <= 0;
            //                       MDR_mem_write <= 0; 
            // MDR_read        <= 0; 
          
        end

        st2: begin
            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            MAR_write       <= 0; MAR_mem_read  <= 0;
            MEM_RW          <= 0; MEM_EN        <= 0;
                                  MDR_mem_write <= 1; 
            MDR_read        <= 0; 
        end

        st3: begin

            R0_read <= 0;
            R1_read <= 0;
            R2_read <= 0;
            R3_read <= 0;
            P0_read <= 0;
            MAR_write       <= 0; MAR_mem_read  <= 0;
            MEM_RW          <= 0; MEM_EN        <= 0;
                                  MDR_mem_write <= 0; 
            MDR_read        <= 1; 
            case(Rj)

                0: R0_write <= 1;
                1: R1_write <= 1;
                2: R2_write <= 1;
                3: R3_write <= 1;
                4: P0_write <= 1;

            endcase
            
        end

        DONE: begin

            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            MAR_write       <= 0; MAR_mem_read  <= 0;
            MEM_RW          <= 0; MEM_EN        <= 0;
                                  MDR_mem_write <= 0; 
            MDR_read        <= 0; 
            
            done <= 1;
        end

    endcase 
end //fsm          

endmodule