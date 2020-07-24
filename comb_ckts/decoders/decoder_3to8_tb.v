//testbench module for 3 to 8 decoder
`timescale 1ns/1ps

module decoder_3to8_tb (
    
);
wire [7:0]OUT;
reg  [2:0] IN;

//instantiation
decoder_3to8 d1(OUT,IN);

initial begin
    $dumpfile("decoder_3to8_tb.vcd");
    $dumpvars(0,decoder_3to8_tb);

    $monitor($time," input = %b decoded output = %b", IN,OUT);

    #1 IN=3'd0;
    #1 IN=3'd1;
    #1 IN=3'd2;
    #1 IN=3'd3;
    #1 IN=3'd4;
    #1 IN=3'd5;
    #1 IN=3'd6;
    #1 IN=3'd7;
end

endmodule //decoder_3to8_tb