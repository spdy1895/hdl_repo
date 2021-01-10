`timescale 1ns/1ps 
/*
data-path instantiates the fundamental functional blocks
1.PIPO
2.MUX
3.SUB
4.COMPARATOR
*/

`include "PIPO.v"
`include "MUX.v"
`include "SUB.v"
`include "COMPARE.v"

module GCD_datapath (
    output wire gt, lt, eq,
    output wire [15:0] GCD,
    input wire [15:0] data_in,
    input wire LdA, LdB, sel1, sel2, sel_in, clk 
);
wire [15:0] Aout, Bout, X, Y, Bus, SubOut;

assign GCD= Bus;

PIPO A(Aout, Bus, LdA, clk);
PIPO B(Bout, Bus, LdB, clk);
MUX MUX_in1(X, Aout, Bout, sel1);
MUX MUX_in2(Y, Aout, Bout, sel2);
MUX MUX_load(Bus, SubOut, data_in, sel_in);
SUB SB(SubOut, X, Y);
COMPARE COMP(lt, gt, eq, Aout, Bout);

endmodule //GCD_datapath