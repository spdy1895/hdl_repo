`timescale 1ns/1ps 
`include "top.v"

module top_tb (
    
);

wire done;
wire [9:0] MUL_result;
reg [4:0] data_in;
reg start, clk;

top t0(done, MUL_result, data_in, start, clk);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, top_tb);

    start= 1'b1;
    data_in= 5'b10110;
    #26 data_in= 5'd13;
    #200 $finish;
end

endmodule //top_tb