`timescale 1ns/1ps 
`include "top.v"
module top_tb (

);

wire done;
wire [15:0] MUL_output;
reg [15:0] data_in;
reg start, clk;

top t0(done, MUL_output, data_in, start, clk);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, top_tb);

    data_in= 17;
    #3 start= 1'b1;
    #23 data_in= 5;
    #100 $finish;
end

endmodule //top_tb