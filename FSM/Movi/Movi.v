// 0111 Ri Rj
module Movi
(
    clk, reset, start, Ri, num, 
    out_to_bus,
    done,
    R0_write,
    R1_write,
    R2_write,
    R3_write,
    P0_write
);

input clk, reset, start;
input[5:0] Ri, num;

output reg R0_write;
output reg R1_write;
output reg R2_write;
output reg R3_write;
output reg P0_write;
output reg done;

output[15:0] out_to_bus;

reg[1:0] pres_state, next_state;

reg read;

parameter  INIT = 0, MAIN = 1, NEXT_I = 2;


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

        INIT: begin 
            if(start) next_state <= MAIN;
            else next_state <= INIT;
        end
        MAIN:   next_state <= NEXT_I;
        NEXT_I: next_state <= INIT;
        default: next_state<= INIT;

    endcase end //fsm


always   @(pres_state)
begin: outputs
    case (pres_state)
        INIT: begin

            R0_write <= 0;
            R1_write <= 0;
            R2_write <= 0;
            R3_write <= 0;
            P0_write <= 0;
            read <= 0;
            done <= 0;

        end

        MAIN: begin

            case(Ri)
                0: R0_write <= 1;
                1: R1_write <= 1;
                2: R2_write <= 1;
                3: R3_write <= 1;
                4: P0_write <= 1;
            endcase

            read <= 1;
        
        end

        NEXT_I: begin
            R0_write <= 0;
            R1_write <= 0;
            R2_write <= 0;
            R3_write <= 0;
            P0_write <= 0;
            read <= 0;
            done <= 1;
        end

    endcase 
end //fsm          

assign out_to_bus = read? num : 16'hzzzz;

endmodule