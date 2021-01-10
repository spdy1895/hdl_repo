`timescale 1ns/1ps 
`include "even_parity.v"
module even_parity_tb (
    
);
wire parity;
reg [15:0] in;
reg clock;

integer myseed;

even_parity e0(parity, in, clock);

initial begin
    clock= 1'b0;
    forever #5 clock= ~clock;
end

initial begin
    $dumpfile("even_parity_tb.vcd");
    $dumpvars(0, even_parity_tb);

    myseed= 15;
    in= $random(myseed); #30;
    in= $random(myseed); #30;
    #30 $finish;
end
endmodule //even_parity_tb