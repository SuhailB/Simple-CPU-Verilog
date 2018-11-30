// 0111 Ri Rj

module Move
(
    clk, reset, start, Ri, Rj, 
    done,
    R0_write, R0_read,
    R1_write, R1_read,
    R2_write, R2_read,
    R3_write, R3_read,
    P0_write, P0_read
);

input clk, reset, start;
input[5:0] Ri, Rj;

output reg R0_write, R0_read;
output reg R1_write, R1_read;
output reg R2_write, R2_read;
output reg R3_write, R3_read;
output reg P0_write, P0_read;

output reg done;

reg[1:0] pres_state, next_state;
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

        INIT: if(start) next_state <= MAIN;
        MAIN:   next_state <= NEXT_I;
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

            case(Rj)
                0: R0_read <= 1;
                1: R1_read <= 1;
                2: R2_read <= 1;
                3: R3_read <= 1;
                4: P0_read <= 1;
            endcase
        end

        NEXT_I: begin
            R0_write <= 0; R0_read <= 0;
            R1_write <= 0; R1_read <= 0;
            R2_write <= 0; R2_read <= 0;
            R3_write <= 0; R3_read <= 0;
            P0_write <= 0; P0_read <= 0;
            done <= 1;
        end

    endcase 
end //fsm          

endmodule


// always @(posedge clk or posedge reset)
// begin
//     if(reset) begin
        
//         R0_write <= 0;
//         R1_write <= 0;
//         R2_write <= 0;
//         R3_write <= 0;

//         R0_read <= 0;
//         R1_read <= 0;
//         R2_read <= 0;
//         R3_read <= 0;
        
//     end

//     else begin
//         case(Ri)
//             0: R0_write <= 1;
//             1: R1_write <= 1;
//             2: R2_write <= 1;
//             3: R3_write <= 1;
//         endcase

//         case(Rj)
//             0: R0_read <= 1;
//             1: R1_read <= 1;
//             2: R2_read <= 1;
//             3: R3_read <= 1;
//         endcase
//     end
// end

// endmodule