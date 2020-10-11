`timescale 1ns/1ps 
`include "counter.v"
module counter_tb (
    
);
reg clk, clear;

//counter #(16) c0( , clk, clear);
//counter #(.N(6)) c0( , clk, clear);
/*
counter #(N=6) c0( , clk, clear);
>this parameter overriding doesn't works.
*/
counter c0( , clk, clear);
defparam c0.N= 6;

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0, counter_tb);

    clear= 1'b1; #30;
    clear= 1'b0; #3000;
    $finish;
end

endmodule //counter_tb