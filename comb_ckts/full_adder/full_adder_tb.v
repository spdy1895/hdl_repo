//testbench module for full adder
`timescale 1ns/1ps

module full_adder_tb (
    
);

wire SUM,CARRY;
reg A,B,C_IN;

//instantiate
full_adder f1(SUM,CARRY,A,B,C_IN);

initial begin
    
    $dumpfile("full_adder_tb.vcd");
    $dumpvars(0,full_adder_tb);

    $monitor($time," A= %b, B= %b, C_IN= %b  SUM= %b , CARRY= %b",A,B,C_IN,SUM,CARRY);

    #1 {A,B,C_IN}=3'b000;
    #1 {A,B,C_IN}=3'b001;
    #1 {A,B,C_IN}=3'b010;
    #1 {A,B,C_IN}=3'b011;

    #1 {A,B,C_IN}=3'b100;
    #1 {A,B,C_IN}=3'b101;
    #1 {A,B,C_IN}=3'b110;
    #1 {A,B,C_IN}=3'b111;

end

endmodule //full_adder_tb