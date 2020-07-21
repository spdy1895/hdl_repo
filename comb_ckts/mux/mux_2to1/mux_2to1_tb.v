//testbench for 2 to 1 mux
`timescale 1ns/1ps
//`include "mux_2to1.v"

module mux_2to1_tb (
    
);

reg  A,B,SEL;
wire Y;
//instantiation
mux_2to1 m1(.y(Y),.a(A),.b(B),.sel(SEL));

initial begin: mux_2to1

    $dumpfile("mux_2to1_tb.vcd");
    $dumpvars(0,mux_2to1_tb);
    
    $monitor($time," select line = %b output Y = %b",SEL,Y);
    
    A=0; B=1;
    #2 SEL=0;

    #2 SEL=1;

end

endmodule //mux_2to1_tb