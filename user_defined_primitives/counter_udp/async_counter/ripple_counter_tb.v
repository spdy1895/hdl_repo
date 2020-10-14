`timescale 1ns/1ps 
`include "ripple_counter.v"

module ripple_counter_tb (
    
);
wire [5:0] count;
reg en, clock, clear;

ripple_counter r0(count, en, clock, clear);

initial begin
    clock= 1'b0;
    forever #5 clock= ~clock;
end

initial begin
    $dumpfile("ripple_counter_tb.vcd");
    $dumpvars(0, ripple_counter_tb);

    clear= 1'b1; #30;
    en= 1'b1; clear= 1'b0; #60;
    #1000 clear= 1'b1; #50;
    $finish;
end
endmodule //ripple_counter_tb