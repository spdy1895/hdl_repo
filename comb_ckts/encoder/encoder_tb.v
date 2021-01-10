//testbench module for encoder
`timescale 1ns/1ps

module encoder_tb (
    
);

wire [2:0] Y;
reg [7:0] I;

//instantiate
//encoder e1(Y,I);
encoder_for e1(Y,I);

initial begin
    $dumpfile("encoder_tb.vcd");
    $dumpvars(0,encoder_tb);

    $monitor($time," input i= %b encoded output = %b ",I,Y);

    #1 I=8'b0000_0001;
    #1 I=8'b0000_0010;
    #1 I=8'b0000_0100;
    #1 I=8'b0000_1000;
    #1 I=8'b0001_0000;
    #1 I=8'b0010_0000;
    #1 I=8'b0100_0000;
    #1 I=8'b1000_0000;
    
end

endmodule //encoder_tb