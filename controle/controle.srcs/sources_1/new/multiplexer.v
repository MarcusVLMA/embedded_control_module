`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
Design da CPU LEG_V8 Single-Cycle.
Disciplina: TI0148 - Sistemas Embarcados
M�dulo: multiplexer.v
Fun��o: M�dulo de Controle
Grupo Respons�vel: Marcus Vin�cius, Pablo Grisi e Lucas Ribeiro
*/
//////////////////////////////////////////////////////////////////////////////////
module multiplexer(
    input [63:0] in0,
    input [63:0] in1,
    input sel,
    
    output reg [63:0] out
    );
    
    always @(in0,in1,sel)
        begin
            if(sel == 0) begin
                out = in0;  //quando o sinal do "sel" � baixo.
            end
            else begin
                out = in1;  //quando o sinal do "sel" � alto.
            end
        end
    
endmodule
