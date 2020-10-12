`timescale 1ns/1ps 
`include "mux_4to1.v"
module mux_4to1_tb (
    
);
wire f;
reg s1, s0, in0, in1, in2, in3;

mux_4to1 m0(f, s1, s0, in0, in1, in2, in3);

initial begin
    $dumpfile("mux_4to1_tb.vcd");
    $dumpvars(0, mux_4to1_tb);
    {in0, in1, in2, in3}= 4'b0100; #30;
    {s1, s0}= 2'b10; #30;
    {s1, s0}= 2'b01; #30;
    {in0, in1, in2, in3}= 4'b1101;
    {s1, s0}= 2'b00; #30;
    {s1, s0}= 2'b11; #30;

end

endmodule //mux_4tp1_tb