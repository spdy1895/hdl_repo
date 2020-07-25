//testbench module for carry look ahead adder
`timescale 1ns/1ps

module carry_look_ahead_tb (
    
);

wire [3:0] SUM, CARRY_AHEAD;
reg [3:0] A,B;
reg C_IN;

//instantiate
carry_lahead c1(SUM, CARRY_AHEAD, A, B, C_IN );

initial begin

    $display("debugging testbench!");

    $dumpfile("carry_look_ahead_tb.vcd");
    $dumpvars(0,carry_look_ahead_tb);

    $monitor($time," A= %b B= %b C_IN= %b SUM= %b CARRY_AHEAD= %b",
    A,B,C_IN,SUM,CARRY_AHEAD);

    #1 A= 4'b1100; B= 4'b0001; C_IN=0;

    #1 A= 4'b0111; B= 4'b0111; C_IN=1;

    #1 A= 4'b1000; B= 4'b1000; C_IN=0;

end



endmodule //carry_look_ahead_tb