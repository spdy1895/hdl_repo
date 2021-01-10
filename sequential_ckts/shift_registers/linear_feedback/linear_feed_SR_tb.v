`timescale 1ns/1ps 
`include "linear_feed_SR.v"
module linear_feed_SR_tb (
    
);

wire [3:0] Sft_Reg_out;
reg clk, clear;

linear_feed_SR o1(Sft_Reg_out, clk, clear);

initial begin
    clk= 1'b0;
    forever clk= #5 ~clk;
end

initial begin
    $dumpfile("linear_feed_SR_tb.vcd");
    $dumpvars(0, linear_feed_SR_tb);
    $monitor($time, "  %b\n", Sft_Reg_out);

    #6 clear= 1'b0;        //clear activated 
    #20 clear= 1'b1;   //clear deactivated

    #200 $finish;
end
endmodule //linear_feed_SR_tb