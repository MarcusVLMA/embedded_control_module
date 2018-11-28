`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
Design da CPU LEG_V8 Single-Cycle.
Disciplina: TI0148 - Sistemas Embarcados
Módulo: projeto_controle.v
Função: Módulo de Controle
Grupo Responsável: Marcus Vinícius, Pablo Grisi e Lucas Ribeiro
*/
//////////////////////////////////////////////////////////////////////////////////


module projeto_controle(
    input [31:21] instr,
    
    output reg [1:0] aluop,
    output reg alusrc,
    output reg updateflags,
    output reg reg2loc,
    output reg branch,
    output reg branch_cond,
    output reg branch_uncond,
    output reg branch_zero,
    output reg regwrite,
    output reg memread,
    output reg memwrite,
    output reg memtoreg
    );
    wire [10:0] opcode;
    assign opcode = instr[31:21];
    
    always @ (opcode) begin
    //Verificando à qual instrução pertence o opcode
    //BRANCHS
    //Branch Incondicional
        if (opcode == 6'b000101) begin
            aluop = 2'b11;
            alusrc = 0;
            updateflags = 0;
            reg2loc = 0;
            branch = 1;
            branch_cond = 0;
            branch_uncond = 1;
            branch_zero = 0;
            regwrite = 0;
            memread = 0;
            memwrite = 0;
            memtoreg = 0;
        end
        //Branchs Condicionais
        //CBZ
        else if (opcode == 8'b10110100) begin
                    aluop = 2'b11;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 1;
                    branch = 1;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 1;
                    regwrite = 0;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end
        //CBNZ
        else if (opcode == 8'b10110101) begin
                    aluop = 2'b11;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 1;
                    branch = 1;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 0;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end
        //B Condicional
        else if (opcode == 8'b0101100) begin
                    aluop = 2'b11;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 1;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 0;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end
        //INSTRUÇÕES TIPO I
        //ADDI
        else if (opcode == 10'b1001000100) begin
                    aluop = 2'b00;
                    alusrc = 1;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end   
        //SUBI 
        else if (opcode == 10'b1101000100) begin
                    aluop = 2'b00;
                    alusrc = 1;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end   
        //ADDIS
        else if (opcode == 10'b1011000100) begin
                    aluop = 2'b00;
                    alusrc = 1;
                    updateflags = 1;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end
        //SUBIS
        else if (opcode == 10'b1111000100) begin
                    aluop = 2'b00;
                    alusrc = 1;
                    updateflags = 1;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end         
        //INSTRUÇÕES TIPO D
        //LDUR
        else if (opcode == 11'b11111000010) begin
                    aluop = 2'b00;
                    alusrc = 1;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 1;
                    memwrite = 0;
                    memtoreg = 1;
        end                
        //STUR
        else if (opcode == 11'b11111000000) begin
                    aluop = 2'b00;
                    alusrc = 1;
                    updateflags = 0;
                    reg2loc = 1;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 0;
                    memread = 0;
                    memwrite = 1;
                    memtoreg = 0;
        end    
        //INSTRUÇÕES TIPO R
        //ADD
        else if (opcode == 11'b10001011000) begin
                    aluop = 2'b10;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end
        //SUB
        else if (opcode == 11'b11001011000) begin
                    aluop = 2'b10;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end     
        //AND
        else if (opcode == 11'b10001010000) begin
                    aluop = 2'b10;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end     
        //ORR
        else if (opcode == 11'b10001011000) begin
                    aluop = 2'b10;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end
        //EOR
        else if (opcode == 11'b11101010000) begin
                    aluop = 2'b10;
                    alusrc = 0;
                    updateflags = 0;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end          
        //ADDS
        else if (opcode == 11'b10101011000) begin
                    aluop = 2'b10;
                    alusrc = 0;
                    updateflags = 1;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end
        //SUBS
        else if (opcode == 11'b11101011000) begin
                    aluop = 2'b10;
                    alusrc = 0;
                    updateflags = 1;
                    reg2loc = 0;
                    branch = 0;
                    branch_cond = 0;
                    branch_uncond = 0;
                    branch_zero = 0;
                    regwrite = 1;
                    memread = 0;
                    memwrite = 0;
                    memtoreg = 0;
        end        
    end
endmodule
