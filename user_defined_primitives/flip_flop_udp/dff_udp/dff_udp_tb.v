`timescale 1ns/1ps 
`include "dff_udp.v"
module dff_udp_tb (
    
);
wire q;
reg d, clock, clear;

dff_udp d0(q, d, clock, clear);

initial begin
    clock= 1'b0;
    forever #5 clock= ~clock;
end

initial begin
    $dumpfile("dff_udp_tb.vcd");
    $dumpvars(0, dff_udp_tb);

    clear= 1'b1; #30;
    clear= 1'b0; #30;
    d= 1'b1; #30;
    d= 1'b0; #30;
    d= 1'b1; #30;
    d= 1'b1; #30;
    $finish;
end

endmodule //dff_udp_tb