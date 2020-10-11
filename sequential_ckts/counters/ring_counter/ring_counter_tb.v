`timescale 1ns/1ps 
`include "ring_counter.v"
module ring_counter_tb (
    
);
reg init, clk, left;

ring_counter c0( ,init, clk, left);
defparam c0.N= 4;

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("ring_counter_tb.vcd");
    $dumpvars(0,ring_counter_tb);

    init= 1'b1; #10;
    init= 1'b0; left= 1'b1; #150;
    left= 1'b0; #100;
    $finish;
end

endmodule //ring_counter_tb