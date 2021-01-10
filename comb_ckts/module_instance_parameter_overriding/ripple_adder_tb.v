`timescale 1ns/1ps 
`include "ripple_adder.v"
module ripple_adder_tb();
wire [3:0] sum;
wire carry_out;
reg [3:0] a, b;
reg c_in;
integer i;

ripple_adder a0(sum, carry_out, a, b, c_in);

initial begin
    $dumpfile("ripple_adder_tb.vcd");
    $dumpvars(0, ripple_adder_tb);    

    {a, b, c_in}= $random; #10;
    {a, b, c_in}= $random; #10;
end
endmodule