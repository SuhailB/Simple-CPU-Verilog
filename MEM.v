`timescale 1ns/1ps

//module MEM(MEM_to_MDR, MFC, EN, MAR_to_MEM, MDR_to_MEM, RW); 
module MEM(MEM_to_MDR, MFC, EN, MAR_to_MEM, MDR_to_MEM, RW); 
input EN, RW;
input[15:0] MAR_to_MEM, MDR_to_MEM;
output [15:0] MEM_to_MDR;
output MFC; 

reg [15:0] MEM_to_MDR, memorycell; 
reg MFC = 0; 


always@(posedge EN) 
begin  
    if(RW==1) begin       
        case(MAR_to_MEM) 
            16'b0000000000000000: MEM_to_MDR = 16'b1111000001010101; 
            16'b0000000000000001: MEM_to_MDR = 16'b1111000010101111; 
            16'b0000000000000010: MEM_to_MDR = 16'b0000000001000010; 
            16'b0000000000000011: MEM_to_MDR = 16'b0111000100000001; 
            16'b0000000000000100: MEM_to_MDR = 16'b0101000010000001; 
            16'b0000000000000101: MEM_to_MDR = 16'b0010000010000000; 
            16'b0000000000000110: MEM_to_MDR = 16'b1011000100000010;
            16'b0000000000000111: MEM_to_MDR = 16'b1010000010000000;
            default: MEM_to_MDR = memorycell; 
        endcase 
    end
    
    else memorycell = MDR_to_MEM; 
    
    //wait for the read or write to happen
    #5 MFC = 1; 
    #50 MFC = 0;
end

      endmodule 
