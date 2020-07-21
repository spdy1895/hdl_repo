//module for mux_4to1 testbench
`timescale 1ns/1ps

module mux_4to1_tb (
    
);

wire Y;
reg [3:0] I;
reg [1:0] SEL;

//instantiation
mux_4to1 m1(Y,I,SEL);

initial begin
    $dumpfile("mux_4to1_tb.vcd");
    $dumpvars(0,mux_4to1_tb);

    $monitor($time,"  select s = %d  output Y = %d",SEL,Y);

    I= 4'b1010;

    #1 SEL=2'b00;
    #1 SEL=2'b01;
    #1 SEL=2'b10;
    #1 SEL=2'b11;
end

endmodule //mux_4to1_tb