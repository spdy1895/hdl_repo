//testbench module for gray code converter
`timescale 1ns/1ps

module gray_code_conv_tb (
    
);
wire [3:0] OUT;
reg [3:0] IN;

//instantiation 
gray_code_conv g1(OUT,IN);

initial begin
    
    $dumpfile ("gray_code_conv_tb.vcd");
    $dumpvars (0,gray_code_conv_tb);

$monitor($time," input = %b gray coded output = %b ",IN, OUT);

#1 IN=4'b0000;
#1 IN=4'b0001;
#1 IN=4'b0010;
#1 IN=4'b0011;

#1 IN=4'b0100; 
#1 IN=4'b0101;
#1 IN=4'b0110;
#1 IN=4'b0111;

#1 IN=4'b1000;
#1 IN=4'b1001;
#1 IN=4'b1010;
#1 IN=4'b1011;

#1 IN=4'b1100;
#1 IN=4'b1101;
#1 IN=4'b1110;
#1 IN=4'b1111;

end

endmodule //gray_code_conv_tb