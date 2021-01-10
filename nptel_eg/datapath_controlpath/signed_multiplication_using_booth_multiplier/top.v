`timescale 1ns/1ps 
/*
top module to instantiate the fundamental blocks of
signed multiplication using Booth multiplication
1.shift register A
2.shift register Q
3.dff
4.PIPO M
5.ALU
6.COUNTER
*/
`include "BOOTH_datapath.v"
`include "BOOTH_controller.v"

module top (
    output wire done,
    output wire [9:0] MUL_result,
    input wire [4:0] data_in, 
    input wire start, clk 
);

wire    LdA, clrA, sftA,
        LdQ, clrQ, sftQ,
        clrff, sftDff,
        LdM,
        q0, qm1,
        LdCount, decr,
        add_sub, EnableALU,
        eqz;

BOOTH_datapath DAT(
    .eqz(eqz),

    .LdA(LdA),
    .clrA(clrA),
    .sftA(sftA),

    .LdQ(LdQ),
    .clrQ(clrQ),
    .sftQ(sftQ),

    .LdM(LdM),
    .clrff(clrff),
    .sftDff(sftDff),
    
    .add_sub(add_sub),
    .EnableALU(EnableALU),

    .q0(q0),
    .qm1(qm1),
    
    .LdCount(LdCount),
    .decr(decr),

    .data_in(data_in),
    .data_out(MUL_result),
    
    .clk(clk)
);

BOOTH_controller CTRL(
    .eqz(eqz),
    
    .LdA(LdA),
    .clrA(clrA),
    .sftA(sftA),
    
    .LdQ(LdQ),
    .clrQ(clrQ),
    .sftQ(sftQ),

    .LdM(LdM),
    .clrff(clrff),
    .sftDff(sftDff),
    
    .add_sub(add_sub),
    .EnableALU(EnableALU),
    
    .q0(q0),
    .qm1(qm1),
    
    .LdCount(LdCount),
    .decr(decr),
    
    .start(start),
    .done(done),
    .clk(clk)
);

endmodule //top