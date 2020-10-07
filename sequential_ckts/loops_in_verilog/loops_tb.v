`timescale 1ns/1ps 
`include "loops.v"
module loops_tb (
    
);
wire out_clk;
reg clk;

loops l1(out_clk, clk);

initial begin
    clk= 1'b0;
    #5 clk= ~clk;
    #5 clk= 1'b0;
    #5 clk= 1'b1;
    #5 clk= 1'b0;
    #5 clk= 1'b1;
    #5 clk= 1'b0;
    #5 clk= 1'b1;
    #5 clk= 1'b0;
end

initial begin
    $dumpfile("loops_tb.vcd");
    $dumpvars(0, loops_tb);
    #100 $finish;
end

endmodule //loops_tb