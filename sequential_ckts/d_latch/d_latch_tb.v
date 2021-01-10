`timescale 1ns/1ps 
`include "d_latch.v"

module d_latch_tb (
    
);

wire q;
reg d, enable;

d_latch d1(q, d, enable);

initial begin
    enable= 1'b0;
    forever #5 enable= ~enable;
end

initial begin
    $dumpfile("d_latch_tb.vcd");
    $dumpvars(0, d_latch_tb);

    d= 1'b1; #20;
    d= 1'b0; #20;
    d= 1'b0; #20;
    d= 1'b1; #20;
    #30 $finish;
end

endmodule //d_latch_tb