`timescale 1ns/1ps 
`include "shiftreg_4bit.v"
module shiftreg_4bit_tb (
    
);

wire e;
reg a, clk, clear;

shiftreg_4bit s0(e, a, clk, clear);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("shiftreg_4bit.vcd");
    $dumpvars(0, shiftreg_4bit_tb);

    clear= 1'b0; #34;
    clear= 1'b1; a= 1'b1; #10;
    a= 1'b0; #10;
    a= 1'b1; #10;
    a= 1'b1; #10;
    a= 1'bx; #60;
    clear= 1'b0;#60;
    $finish; 
end

endmodule //shiftreg_4bit_tb