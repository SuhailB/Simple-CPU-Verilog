module Decoder(clk, opCode, start_move, start_movi);

input clk;
input[3:0] opCode;

output reg start_move, start_movi;

always @(*)
begin
    if(clk) begin
    case(opCode)

        4'b0111: begin
            start_move <= 1;
            start_movi <= 0;
        end
        4'b1111: begin
            start_move <= 0;
            start_movi <= 1;
        end

    endcase
    end
    else begin
        start_move <= 0;
        start_movi <= 0;
    end
end

endmodule

