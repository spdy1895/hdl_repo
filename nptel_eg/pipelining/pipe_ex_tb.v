`timescale 1ns/1ps 
`include "pipe_ex.v"
module pipe_ex_tb (
    
);

parameter N=10;
wire [N-1:0] F;
reg [N-1:0] A, B, C, D;
reg clk;

pipe_ex p0(F, A, B, C, D, clk);

initial begin
    clk= 1'b0;
    forever #10 clk= !clk;
end

initial begin
    $dumpfile("pipe_ex_tb.vcd");
    $dumpvars(0, pipe_ex_tb);

    #5 {A, B, C, D}= {10'd10, 10'd12, 10'd6, 10'd3};
    #20 {A, B, C, D}= {10'd10, 10'd10, 10'd5, 10'd3};
    #20 {A, B, C, D}= {10'd20, 10'd11, 10'd1, 10'd4};
    #20 {A, B, C, D}= {10'd15, 10'd10, 10'd8, 10'd2};
    #20 {A, B, C, D}= {10'd8, 10'd15, 10'd5, 10'd0};
    #20 {A, B, C, D}= {10'd10, 10'd20, 10'd5, 10'd3};
    #20 {A, B, C, D}= {10'd10, 10'd10, 10'd30, 10'd1};
    #20 {A, B, C, D}= {10'd30, 10'd1, 10'd2, 10'd4};
    #60 $finish;
end
endmodule //pipe_ex_tb