module ALU (reset, IN1_i, IN2_i, IN1_en, IN2_en, OUT_o, OUT_en, OUT_reg_en, OpControl);

//parameters
parameter ADD  = 0;
parameter SUB  = 1;
parameter NOT  = 2;
parameter AND  = 3;
parameter OR   = 4;
parameter XOR  = 5;
parameter XNOR = 6;

//inputs
input reset;
input[15:0] IN1_i;
input[15:0] IN2_i;
input IN1_en;
input IN2_en;
input OUT_en;
input OUT_reg_en;
input[2:0] OpControl;

//outputs
output reg[15:0] OUT_o;

//internal signals
reg[16:0] IN1;
reg[16:0] IN2;
reg[16:0] OUT;

//implementation
always @(*)
begin
    case(OpControl)
        ADD:        OUT <= OUT_EN? IN1 + IN2 : 16'hzzzz;
        SUB:        OUT <= OUT_EN? IN1 - IN2 : 16'hzzzz;
        NOT:        OUT <= OUT_EN? ~IN1      : 16'hzzzz;
        AND:        OUT <= OUT_EN? IN1 & IN2 : 16'hzzzz;
        OR:         OUT <= OUT_EN? IN1 | IN2 : 16'hzzzz;
        XOR:        OUT <= OUT_EN? IN1 ^ IN2 : 16'hzzzz;
        XNOR:       OUT <= OUT_EN? IN1 ~^ IN2: 16'hzzzz;
        default:    OUT <= OUT_EN? 16'h0000  : 16'hzzzz;
    endcase
end


endmodule
