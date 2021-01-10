`timescale 1ns/1ps 
`include "counter.v"

module counter_tb (
    
);
 
wire [3:0] count;
reg clk, reset;

counter c0(count, reset, clk);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0, counter_tb);

    reset= 1'b1; #30;
    reset= 1'b0; #200;
    $finish;
end

endmodule //counter_tb