`timescale 1ns/1ps 
`include "parity_gen.v"

module parity_gen_tb (
    
);

wire parity;
reg clk, in;

parity_gen p0(parity, clk, in);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("parity_gen_tb.vcd");
    $dumpvars(0, parity_gen_tb);

    in= 1'b1; #15;
    in= 1'b1; #15;
    in= 1'b0; #15;
    in= 1'b1; #15;
    in= 1'b0; #15;
    
    $finish;
end

endmodule //parity_gen_tb