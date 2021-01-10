//tetsbench for BCD adder
`timescale 1ns/1ps

module bcd_adder_tb (
    
);

wire [4:0] RES;
reg [3:0] A,B;

//instantiation 
bcd_adder b1(RES,A,B);

initial begin
    
    $dumpfile("bcd_adder_tb.vcd");
    $dumpvars(0,bcd_adder_tb);

    $monitor($time," A= %b B= %b RESULT= %b ",A,B,RES);

    #1 A= 4'b0011; B= 4'b0010;

    #1 A= 4'b1000; B= 4'b0101;

    #1 A= 4'b1100; B= 4'b0011;

    #1 A= 4'b1110; B= 4'b1111;

end

endmodule //bcd_adder_tb