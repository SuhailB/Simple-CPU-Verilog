module Decoder(enable, opCode, start_move, start_movi, start_ALU, start_ALUI, start_load, start_store);

input enable;
input[3:0] opCode;

output reg start_move, start_movi, start_ALU, start_ALUI, start_load, start_store;

always @(*)
begin
    if(enable) begin
    case(opCode)

        4'b0000: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 1;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end
        4'b0001: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 1;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end
        4'b0010: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 1;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end
        4'b0011: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 1;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end
        4'b0100: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 1;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end
        4'b0101: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 1;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end
        4'b0110: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 1;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end

        4'b1000: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 0;
            start_ALUI <= 1;
            start_load <= 0;
            start_store<= 0;
        end

        4'b1001: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 0;
            start_ALUI <= 1;
            start_load <= 0;
            start_store<= 0;
        end

        4'b0111: begin
            start_move <= 1;
            start_movi <= 0;
            start_ALU  <= 0;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end
        4'b1111: begin
            start_move <= 0;
            start_movi <= 1;
            start_ALU  <= 0;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 0;
        end

         4'b1010: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 0;
            start_ALUI <= 0;
            start_load <= 1;
            start_store<= 0;
        end

        4'b1011: begin
            start_move <= 0;
            start_movi <= 0;
            start_ALU  <= 0;
            start_ALUI <= 0;
            start_load <= 0;
            start_store<= 1;
        end

    endcase
    end
    else begin
        start_move <= 0;
        start_movi <= 0;
        start_ALU  <= 0;
        start_ALUI <= 0;
        start_load <= 0;
        start_store<= 0;
    end
end

endmodule

