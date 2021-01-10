//testbench for mux 10 to 1
`timescale 1ns/1ps
module mux16to1_tb (
    
);

output wire OUT;
reg [15:0] IN;
reg [3:0] SEL;

//instantiate
mux16to1 m1(OUT,IN,SEL);

initial begin
    $dumpfile("mux16to1_tb.vcd");
    $dumpvars(0,mux16to1_tb);
    $monitor($time,"OUTPUT= %b  INPUT= %b  SELECT= %b ",OUT,IN,SEL);

    #5 IN= 16'h3f0a; SEL= 4'b0000;
    #5 SEL= 4'b1111;
    #5 SEL= 4'b0110;
    #5 SEL= 4'b1100;
    #5 $finish; 

end


endmodule //mux16to1_tb