`timescale 1ns/1ps 
`include "tff_udp.v"
module tff_udp_tb (
    
);
wire q;
reg t, clock, clear;

tff_udp t0(q, t, clock, clear);

initial begin
    clock= 1'b0;
    forever #5 clock= ~clock;
end

initial begin
    $dumpfile("tff_udp_tb.vcd");
    $dumpvars(0, tff_udp_tb);

    clear= 1'b1; #30;
    clear= 1'b0; t= 1'b0; #30;
    t= 1'b1; #30;
    t= 1'b0; #30;
    t= 1'b1; #30;
    t= 1'b1; #30;
    #60;
    $finish;
end

endmodule //dff_udp_tb