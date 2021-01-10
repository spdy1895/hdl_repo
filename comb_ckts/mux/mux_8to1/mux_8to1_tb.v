//testbench for mux 8to1
`timescale 1ns/1ps

module mux_8to1_tb (
    
);

wire Y;
reg [7:0] I;
reg [2:0] SEL;

mux_8to1 m1(Y,I,SEL);

initial begin
    $dumpfile("mux_8to1_tb.vcd");
    $dumpvars(0,mux_8to1_tb);

    $monitor($time," select s= %d output Y= %d ",SEL,Y);

    I=8'b0101_0101;

    #1 SEL=3'b000;
    #1 SEL=3'b001;
    #1 SEL=3'b010;
    #1 SEL=3'b011;
    #1 SEL=3'b100;
    #1 SEL=3'b101;
    #1 SEL=3'b110;
    #1 SEL=3'b111;
    
end

endmodule //mux_8to1_tb