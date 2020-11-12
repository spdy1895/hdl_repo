`timescale 1ns/1ps 
`include "top.v"
module top_tb (
    
);

wire done;
wire [15:0] GCD;   
reg [15:0] data_in;
reg start, clk;

top t0(
    .done(done),
    .GCD(GCD),
    .data_in(data_in),
    .start(start),
    .clk(clk)
);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, top_tb);

    start= 1'b1;
    #12 data_in= 16'd143;
    #10 data_in= 16'd78;
    #1000 $finish;
end


endmodule //top_tb