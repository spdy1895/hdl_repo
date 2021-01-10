//testbench for jk flip-flop

`timescale 1ns/1ps
`include "jk_flip_flop.v"

module jk_flip_flop_tb (
    
);

//declaration of stimulus signals
wire q, qbar;
reg _clr, j, k , clk;

//instantiation of DUT
jk_flip_flop j1(q, qbar, _clr, j, k, clk);

//generation of clock
always begin
    clk= 1; #5;
    clk= 0; #5;
end

//stimulus block
initial begin

    $dumpfile("jk_flip_flop_tb.vcd");
    $dumpvars(0, jk_flip_flop_tb);

    $monitor($time, "\tclr=%b, \tj=%b, \tk=%b, \tq=%b", _clr, j, k, q);

    #20 _clr= 0;     //clear activated (clear is active low)
    #20 {j, k}= {1'b1, 1'b0};         // set flip flop
    _clr= 1'b1;         //deactivating my clock
    #20 {j, k}= {1'b0, 1'b0};         // hold flip flop
    #20 {j, k}= {1'b0, 1'b1};         // reset flip flop
    #20 {j, k}= {1'b1, 1'b1};         // toggle flip flop
    #60 $finish;
end

endmodule //jk_flip_flop_tb