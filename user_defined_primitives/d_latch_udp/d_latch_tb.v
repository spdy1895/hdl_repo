`timescale 1ns/1ps 
`include "d_latch.v"
module d_latch_tb (
    
);
wire q;
reg d, clk, clr;

d_latch d1(q, d, clk, clr);

initial begin
    $dumpfile("d_latch_tb.vcd");
    $dumpvars(0, d_latch_tb);

    {d, clk, clr}= 3'b000;  #30;
    {d, clk, clr}= 3'b001;  #30;
    {d, clk, clr}= 3'b010;  #30;
    {d, clk, clr}= 3'b011;  #30;
    {d, clk, clr}= 3'b100;  #30;
    {d, clk, clr}= 3'b101;  #30;
    {d, clk, clr}= 3'b110;  #30;
    {d, clk, clr}= 3'b111;  #30;
end

endmodule //d_latch_tb