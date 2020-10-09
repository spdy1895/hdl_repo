`timescale 1ns/1ps 
`include "counter_5to67.v"
module counter_5to67_tb (
    
);
wire [7:0] count;
reg clk;

counter_5to67 c1(count, clk);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("counter_5to67_tb.vcd");
    $dumpvars(0,counter_5to67_tb);
    #1000 $finish;
end

endmodule //counter_5to67_tb