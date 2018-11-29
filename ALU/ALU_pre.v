//module ALU (reset, clk, in_from_bus, writeIN1, writeIN2, alu_out_en, read, OpControl, out_to_bus);
module ALU (clk, reset, in_from_bus, out_to_bus, read, writeIN1, writeIN2, alu_out_en, OpControl);
//parameters
parameter ADD  = 0;
parameter SUB  = 1;
parameter NOT  = 2;
parameter AND  = 3;
parameter OR   = 4;
parameter XOR  = 5;
parameter XNOR = 6;

//inputs
input clk;
input reset;
input[15:0] in_from_bus;
input writeIN1;
input writeIN2;
input alu_out_en;
input read;
input[2:0] OpControl;

//outputs
output [15:0] out_to_bus;

//internal signals
reg[15:0] IN1_reg;
reg[15:0] IN2_reg;
reg[15:0] OUT_reg;

always @(posedge clk or posedge reset)
begin
    if(reset) begin
        IN1_reg <= 0;
        IN2_reg <= 0;
        end
    else begin 
        if(writeIN1) IN1_reg <= in_from_bus;
        if(writeIN2) IN2_reg <= in_from_bus;
        end
end

//implementation
always @(*)
begin
if(reset) OUT_reg <= 0;
else if(alu_out_en) begin
        case(OpControl)
            ADD:        OUT_reg <= IN1_reg + IN2_reg ;
            SUB:        OUT_reg <= IN1_reg - IN2_reg ;
            NOT:        OUT_reg <= ~IN1_reg          ;
            AND:        OUT_reg <= IN1_reg & IN2_reg ;
            OR:         OUT_reg <= IN1_reg | IN2_reg ;
            XOR:        OUT_reg <= IN1_reg ^ IN2_reg ;
            XNOR:       OUT_reg <= IN1_reg ~^ IN2_reg;
            default:    OUT_reg <= 16'h0000          ;
        endcase
    end
end

assign out_to_bus = read? OUT_reg : 16'hzzzz;

endmodule
