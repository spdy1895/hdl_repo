`timescale 1ns/1ps 
`include "sync_counter.v"
module sync_counter_tb (
    
);
wire [3:0] count;
reg en, clock, clear;

sync_counter s0(count, en, clock, clear);

initial begin
    clock= 1'b0;
    forever #5 clock= ~clock;
end

initial begin
    $dumpfile("sync_counter_tb.vcd");
    $dumpvars(0, sync_counter_tb);

    clear= 1'b1; en= 1'b1; #30;
    clear= 1'b0; #200;

    $finish;
end

endmodule //sync_counter_tb