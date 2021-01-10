//testbench module for miscallaneous logic expression

`timescale 1ns/1ps

module misc_tb (
    
);
wire Y;
reg A,B,S0;

//instantiation 
misc m1(Y,A,B,S0);

initial begin
    $dumpfile("misc_tb.vcd");
    $dumpvars(0,misc_tb);

    $monitor($time," a= %b b= %b s0= %b y= %b ",A, B, S0, Y);

    #1 A=0; B=1; S0=0;
    #1 A=0; B=1; S0=1;

    #1 A=1; B=0; S0=0;
    #1 A=1; B=1; S0=1;
    
end


endmodule //misc_tb