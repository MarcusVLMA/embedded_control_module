`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2018 20:52:39
// Design Name: 
// Module Name: simulate_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simulate_file();
/*    reg [31:21] instr_t;
    
    wire [1:0] aluop_t;
    wire alusrc_t,
    updateflags_t,
    reg2loc_t,
    branch_t,
    branch_cond_t,
    branch_uncond_t,
    branch_zero_t,
    regwrite_t,
    memread_t,
    memwrite_t,
    memtoreg_t;
    
    projeto_controle controle_0(
        instr_t,
        aluop_t,
        alusrc_t,
        updateflags_t,
        reg2loc_t,
        branch_t,
        branch_cond_t,
        branch_uncond_t,
        branch_zero_t,
        regwrite_t,
        memread_t,
        memwrite_t,
        memtoreg_t
    );
    
    initial begin
        //Branch Incondicional
        instr_t <= 6'b000101;
        #1;
        
        //CBZ
        instr_t <= 8'b10110100;
        #1;
        
        //CBNZ
        instr_t <= 8'b10110101;
        #1;
        
        //B Condicional
        instr_t <= 8'b0101100;
        #1;
        
        //ADDI
        instr_t <= 10'b1001000100;
        #1;
        
        //SUBI
        instr_t <= 10'b1101000100;
        #1;     
        
        //ADDIS
        instr_t <= 10'b1011000100;
        #1;
        
        //SUBIS
        instr_t <= 10'b1111000100;
        #1;
        
        //LDUR
        instr_t <= 11'b11111000010;
        #1;        
       
        //STUR
        instr_t <= 11'b11111000000;
        #1;
           
        //ADD
        instr_t <= 11'b10001011000;
        #1;
        
        //SUB  
        instr_t <= 11'b11001011000;
        #1;
        
        //AND
        instr_t <= 11'b10001010000;
        #1;
        
        //ORR
        instr_t <= 11'b10001011000;
        #1;           
        
        //EOR
        instr_t <= 11'b11101010000;
        #1;  
        
        //ADDS
        instr_t <= 11'b10101011000;
        #1;  
        
        //SUBS
        instr_t <= 11'b11101011000;
        #1;   
    end*/
 reg sel_t;
 reg [63:0] in0_t, in1_t;
 wire [63:0] out_t;
 multiplexer mux(in0_t, in1_t, sel_t, out_t);
 
 initial begin
    in0_t <= 63'b11;
    in1_t <= 63'b11111111;
    sel_t <= 1'b0;
    #1;
    in0_t <= 63'b11;
    in1_t <= 63'b11111111;
    sel_t <= 1'b1;
    #1;
 end
  
endmodule
