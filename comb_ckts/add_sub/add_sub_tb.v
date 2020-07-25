//testbench module for adder cum subtractor
`timescale 1ns/1ps

module add_sub_tb (
    
);

wire [3:0] RES;
wire CARRY;
reg [3:0] A,B;
reg C_IN;

//instantiation
add_sub a1(RES,CARRY,A,B,C_IN);

initial begin
    
    
    $dumpfile("add_sub_tb.vcd");
    $dumpvars(1,add_sub_tb);

    $monitor($time," A= %b, B= %b, C_IN= %b  --  result= %b, carry= %b  ",
    A,B,C_IN,RES,CARRY);

    #1 A= 4'b0011; B= 4'b0011; C_IN=0;
    
    #1 A= 4'b1010; B= 4'b0011; C_IN=0;
    
    #1 A= 4'b1111; B= 4'b0101; C_IN=0;
    
    #1 A= 4'b1100; B= 4'b1001; C_IN=1;
    
    #1 A= 4'b1100; B= 4'b1110; C_IN=1;

end

endmodule //add_sub_tb