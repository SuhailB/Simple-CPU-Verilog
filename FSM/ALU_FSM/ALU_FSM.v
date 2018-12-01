// 0111 Ri Rj

module ALU_FSM
(
    clk, reset, start, opCode, Ri, Rj, 
    done,
    R0_write, R0_read,
    R1_write, R1_read,
    R2_write, R2_read,
    R3_write, R3_read,
    P0_write, P0_read,
              P1_read,
    ALU_opControl,
    ALU_alu_out_en, ALU_writeIN1, ALU_writeIN2, ALU_read
);

input clk, reset, start;
input[3:0] opCode;
input[5:0] Ri, Rj;

output reg R0_write, R0_read;
output reg R1_write, R1_read;
output reg R2_write, R2_read;
output reg R3_write, R3_read;
output reg P0_write, P0_read;
output reg P1_read;

output reg[2:0] ALU_opControl;
output reg ALU_alu_out_en, ALU_writeIN1, ALU_writeIN2, ALU_read;
output reg done;

reg[2:0] pres_state, next_state;
parameter  INIT = 0, IN1 = 1, IN2 = 2, EVAL = 3, OUT = 4, NEXT_I = 5;


//FSM register
always @(posedge clk or posedge reset)
    begin:statereg
        if (reset)  pres_state <= INIT; 
        else        pres_state <= next_state;
    end //stateregFSM Description by VerilogExample

//FSM next state logic
always @(pres_state or start)
begin: fsm
    case (pres_state)

        INIT: if(start) next_state <= IN1;
        IN1:   next_state <= IN2;
        IN2:   next_state <= EVAL;
        EVAL:  next_state <= OUT;
        OUT:   next_state <= NEXT_I;
        NEXT_I: next_state <= INIT;
        default: next_state<= INIT;

    endcase end //fsm


always   @(pres_state)
begin: outputs
    case (pres_state)
        INIT: begin

            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            P1_read  <= 0;
            ALU_opControl <= 0;
            ALU_alu_out_en <= 0; ALU_writeIN1 <=0; ALU_writeIN2 <= 0; ALU_read <= 0;
            done <= 0;

        end

        IN1: begin

            /////////////////
            R0_write <= 0;
            R1_write <= 0;
            R2_write <= 0;
            R3_write <= 0;
            P0_write <= 0;
            P1_read  <= 0;
            ALU_opControl <= 0;
            ALU_alu_out_en <= 0; ALU_writeIN2 <= 0; ALU_read <= 0;
            ////////////////////////
            case(Ri)
                0: R0_read <= 1;
                1: R1_read <= 1;
                2: R2_read <= 1;
                3: R3_read <= 1;
                4: P0_read <= 1;
            endcase

           ALU_writeIN1 <= 1;

        end

        IN2: begin

            //may be redundant
            R0_write <= 0;
            R1_write <= 0;
            R2_write <= 0;
            R3_write <= 0;
            P0_write <= 0;
            ALU_opControl <= 0;
            ALU_alu_out_en <= 0; ALU_writeIN1 <= 0; ALU_read <= 0;

            case(Ri)
                0: R0_read <= 0;
                1: R1_read <= 0;
                2: R2_read <= 0;
                3: R3_read <= 0;
                4: P0_read <= 0;
            endcase
            ///////////////////

            case(Rj)
                0: R0_read <= 1;
                1: R1_read <= 1;
                2: R2_read <= 1;
                3: R3_read <= 1;
                4: P0_read <= 1;
                5: P1_read <= 1;
            endcase

           ALU_writeIN2 <= 1;
           
        end

        EVAL: begin //if ALU_IN1 or ALU_IN2 changed at this phase the output will change as well because they are not set to zero in this state
            ////////////////////////////////////
            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            P1_read  <= 0;
            ALU_writeIN1 <=0; ALU_writeIN2 <= 0; ALU_read <= 0;
            //////////////////////////////////////////////
            ALU_alu_out_en <= 1;

            ALU_opControl <= opCode[2:0];

        end

        OUT: begin
            ////////////////////////////////////
            R0_read <= 0;
            R1_read <= 0;
            R2_read <= 0;
            R3_read <= 0;
            P0_read <= 0;
            P1_read <= 0;
            ALU_opControl <= 0;
            ALU_alu_out_en <= 0; ALU_writeIN1 <=0; ALU_writeIN2 <= 0;
            //////////////////////////////////////////////////
            
            ALU_read <= 1;

            case(Ri)
                0: R0_write <= 1;
                1: R1_write <= 1;
                2: R2_write <= 1;
                3: R3_write <= 1;
                4: P0_write <= 1;
            endcase
        end

        NEXT_I: begin
            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            P1_read  <= 0;
            ALU_opControl <= 0;
            ALU_alu_out_en <= 0; ALU_writeIN1 <=0; ALU_writeIN2 <= 0; ALU_read <= 0;
            done <= 1;
        end

    endcase 
end //fsm          

endmodule

