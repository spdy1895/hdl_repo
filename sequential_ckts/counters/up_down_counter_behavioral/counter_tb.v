`timescale 1ns/1ps 
`include "counter.v"
module counter_tb (
    
);
wire [7:0] count;
reg [7:0] load_count;
reg mode, clr, ld, clk;

counter c0(count, load_count, mode, clr, ld, clk);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0, counter_tb);

    ld= 1'b0; clr= 1'b1; mode= 1'b1; #30;
    ld= 1'b0; clr= 1'b0; mode= 1'b1; #200;
    ld= 1'b1; load_count= 8'd66; #200;
    ld= 1'b0; #50;
    clr= 1'b1; #50;
    ld= 1'b1; clr= 1'b0; load_count= 8'd110; #20;
    ld= 1'b0; clr= 1'b0; mode= 1'b0; #1200; 
    $finish;
end

endmodule //counter_tb