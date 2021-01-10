`timescale 1ns/1ps 
`include "nor_switch.v"
module nor_switch_tb ( 
    
);
wire out;
reg a, b;

nor_switch n0(out, a, b);

initial begin
    $dumpfile("nor_switch_tb.vcd");
    $dumpvars(0, nor_switch_tb);

    {a, b}= 2'b00; #30;
    {a, b}= 2'b01; #30;
    {a, b}= 2'b10; #30;
    {a, b}= 2'b11; #30;

end
endmodule //nor_switch_tb