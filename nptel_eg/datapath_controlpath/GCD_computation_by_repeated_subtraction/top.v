`timescale 1ns/1ps 
`include "GCD_datapath.v"
`include "GCD_controller.v"
//top module instantiating the fundamental units
module top (
    output wire done,
    output wire [15:0] GCD,
    input wire [15:0] data_in,
    input wire start, clk
);

wire LdA, LdB, sel1, sel2, sel_in, lt, gt, eq;
wire [15:0] BUS;

assign GCD= BUS;

GCD_datapath DAT(
    .gt(gt),
    .lt(lt),
    .eq(eq),
    .GCD(BUS),
    .data_in(data_in),
    .LdA(LdA),
    .LdB(LdB),
    .sel1(sel1),
    .sel2(sel2),
    .sel_in(sel_in),
    .clk(clk)
);
GCD_controller CTRL(
    .gt(gt),
    .lt(lt),
    .eq(eq),
    .start(start),
    .LdA(LdA),
    .LdB(LdB),
    .sel1(sel1),
    .sel2(sel2),
    .sel_in(sel_in),
    .clk(clk),
    .done(done)
);

endmodule //top