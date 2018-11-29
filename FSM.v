module  moore_countmod3 (data, clock, reset, q); 
input reset, clock;
input [1:0]   data;
output q; 
reg  q; 
reg[1:0] pres_state, next_state;
parameter  st0 = 2’b 00, st1 = 2’b 01, st2 = 2’b 10;
//FSM register
always @(posedge clock or negedge reset)
    begin:statereg
        if (!reset) pres_state <= st0; 
        else        pres_state <= next_state;
    end //stateregFSM Description by VerilogExample

//FSM next state logic
always @(pres_state or data)
begin: fsm
    case (pres_state)

        st0: case (data)
            2'b00:   next_state <= st0; 
            2'b11:   next_state <= st2; 
            default: next_state <= st1; 
        endcase 

        st1: case (data)
            2'b00:   next_state <= st1;
            2'b11:   next_state <= st0;
            default: next_state <= st2;
        endcase 

        //FSM Description by VerilogExample
        st2: case (data)
            2'b00:   next_state <= st2;
            2'b11:   next_state <= st1;
            default: next_state <= st0;

        endcase default: next_state<= st0;

    endcase end //fsm
//Moore output definition using pres_state only
always   @(pres_state)
begin: outputs
    if  (pres_state==st0) q <= 1'b1;
    else                  q <= 1'b0;
end //outputsendmodule