`timescale 1ns/1ps

//module MEM(MEM_to_MDR, MFC, EN, MAR_to_MEM, MDR_to_MEM, RW); 
module MEM(MEM_to_MDR, MFC, EN, MAR_to_MEM, MDR_to_MEM, RW); 
input EN, RW;
input[15:0] MAR_to_MEM, MDR_to_MEM;
output [15:0] MEM_to_MDR;
output MFC; 

reg [15:0] MEM_to_MDR, memorycell; 
reg MFC; 


always@(posedge EN) 
begin  
    if(RW==1) begin       
        case(MAR_to_MEM) 
            16'b0000000000000000: MEM_to_MDR = 16'b0111000000000010; 
            16'b0000000000000001: MEM_to_MDR = 16'b1111000011111111; 
            16'b0000000000000010: MEM_to_MDR = 16'b0001000001000011; 
            16'b0000000000000011: MEM_to_MDR = 16'b0101000001000111; 
            16'b0000000000000100: MEM_to_MDR = 16'b1001000001000011; 
            16'b0000000000000101: MEM_to_MDR = 16'b0110000001111111; 
            16'b0000000000000110: MEM_to_MDR = 16'b1101000011000001; 
            16'b0000000000000111: MEM_to_MDR = 16'b1100000001000010; 
            default: MEM_to_MDR = memorycell; 
        endcase 
    end
    
    else memorycell = MDR_to_MEM; 
    #5 MFC = 1; 
end

always@(negedge EN) 
    MFC = 0; 

      endmodule 
