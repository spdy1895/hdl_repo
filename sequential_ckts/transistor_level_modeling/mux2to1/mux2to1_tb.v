`timescale 1ns/1ps 
`include "mux2to1.v"
module mux2to1_tb (    
);
wire out;
reg i0, i1, select;

mux2to1 m0(out, i0, i1, select);

initial begin
    $dumpfile("mux2to1_tb.vcd");
    $dumpvars(0, mux2to1_tb);

    {i0, i1, select}= 3'b000; #30;
    {i0, i1, select}= 3'b001; #30;
    {i0, i1, select}= 3'b010; #30;
    {i0, i1, select}= 3'b011; #30;
    {i0, i1, select}= 3'b100; #30;
    {i0, i1, select}= 3'b101; #30;
    {i0, i1, select}= 3'b110; #30;
    {i0, i1, select}= 3'b111; #30;

end

endmodule //mux2to1_tb