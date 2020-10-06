`timescale 1ns/1ps 
`include "sig_control.v"

module sig_control_tb (
    
);

wire [1:0] hwy, cntry;
reg x, clk, clear;

sig_control s1(hwy, cntry, x, clk, clear);

initial begin
    clk= `FALSE;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("sig_control_tb.vcd");
    $dumpvars(0, sig_control_tb);
end

initial begin
    clear= `TRUE;
    repeat(5) @(negedge clk);
    clear= `FALSE;
end

initial begin
    x= `FALSE;
    repeat(20) @(negedge clk); x= `TRUE;    //20 times the clock cycle 
    repeat(10) @(negedge clk); x= `FALSE;   //20 times the clock cycle
    
    repeat(20) @(negedge clk); x= `TRUE;
    repeat(10) @(negedge clk); x= `FALSE;
    
    repeat(20) @(negedge clk); x= `TRUE;
    repeat(10) @(negedge clk); x= `FALSE;

    repeat(10) @(negedge clk); $finish;
end 

endmodule //sig_control_tb