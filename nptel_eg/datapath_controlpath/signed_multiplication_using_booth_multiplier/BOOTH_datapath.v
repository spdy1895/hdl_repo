`timescale 1ns/1ps 
`include "SHIFTREG1.v"
`include "SHIFTREG2.v"
`include "DFF.v"
`include "PIPO.v"
`include "ALU.v"
`include "COUNTER.v"

module BOOTH_datapath (
    output wire q0, qm1, eqz,
    output wire [9:0] data_out, 
    input wire [4:0] data_in,
    input wire LdA, LdQ, LdM, clrA, clrQ, clrff, 
    sftA, sftQ, sftDff, add_sub, EnableALU, clk, LdCount, decr 
);

wire [4:0] A, M, Q, Z;
wire [3:0] LdCountValue;
wire [3:0] count;

assign eqz= ~|count;
assign data_out= {A, Q};
assign q0= Q[0];

SHIFTREG1 REG_A(A, Z, A[4], clk, LdA, clrA, sftA);
//A[15] -sign of the register A to be carry forwarded for 
//the next iterations after the shift right operation is 
//performed.
SHIFTREG2 REG_Q(Q, LdCountValue, data_in, A[0], clk, LdQ, clrQ, sftQ);
//A[0]- LSB of the register A which is to be shifted to 
//the next register Q which stores the multiplier.
DFF QM1(qm1, Q[0], sftDff, clk, clrff);
//the dff input is Q[0] which is the LSB of register Q
//the multiplier.
PIPO REG_M(M, data_in, clk, LdM);
ALU AL(Z, A, M, add_sub, EnableALU);
COUNTER CN(count, LdCountValue, decr, LdCount,  clk);

endmodule //BOOTH_datapath