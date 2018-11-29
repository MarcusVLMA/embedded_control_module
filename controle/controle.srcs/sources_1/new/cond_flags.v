`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
Design da CPU LEG_V8 Single-Cycle.
Disciplina: TI0148 - Sistemas Embarcados
Módulo: cond_flags.v
Função: Módulo de Controle
Grupo Responsável: Marcus Vinícius, Pablo Grisi e Lucas Ribeiro
*/
//////////////////////////////////////////////////////////////////////////////////


module cond_flags(
    input [4:0] instr,
    input alu_zero,
    input alu_negative,
    input alu_overflow,
    input alu_carry,
    input updateflags,
    input branch_cond,
    
    output reg branch_result
    );
    
    reg [3:0] flags; //NZCV
    
    always @ (updateflags & branch_cond) begin
        //Se for para atualizar as flags, atualizamos as flags armazenadas com os inputs
        if (updateflags == 1) begin  
        
            flags[3] <= alu_negative;
            flags[2] <= alu_zero;
            flags[1] <= alu_carry; 
            flags[0] <= alu_overflow;
            
        end 
        //Se for para realizar a comparação:
        else if (branch_cond == 1) begin
            //B.EQ - Z==1
            if (instr == 5'b00000) begin
                if (flags[2] == 1) begin
                    branch_result = 1;
                end
                else begin
                    branch_result = 0;
                end
            end
            
            //B.NE - Z==0
            else if (instr == 5'b00001) begin
                if (flags[2] == 0) begin
                    branch_result = 1;
                end
                else begin
                    branch_result = 0;
                end                                
            end
            
            //B.GE - N==V
            else if (instr == 5'b01000) begin
                if (flags[3] == flags[0]) begin
                    branch_result = 1;
                end           
                else begin
                    branch_result = 0;
                end                 
            end            
            
            //B.LT - N!=V
            else if (instr == 5'b01001) begin
                if (flags[3] != flags[0]) begin
                    branch_result = 1;
                end           
                else begin
                    branch_result = 0;
                end             
            end
            
            //B.GT - Z==0 && N==V
            else if (instr == 5'b01010) begin
                if ((flags[2] == 0) & (flags[3] == flags[0])) begin
                    branch_result = 1;
                end           
                else begin
                    branch_result = 0;
                end             
            end                        
            
            //B.LE - !((Z==0) && (N==V)) 
            else if (instr == 5'b01011) begin
                if ((flags[2] != 0) | (flags[3] != flags[0])) begin
                    branch_result = 1;
                end            
                else begin
                    branch_result = 0;
                end
            end      
              
        end
    end
    
endmodule
