`timescale 1ns/1ps
`include "parity_functions.v"
module parity_functions_tb (
    
);

wire parity;
reg [15:0] in;

parity_functions p0(parity, in);

initial begin
    $dumpfile("parity_fnctions_tb.vcd");
    $dumpvars(0, parity_functions_tb);
    in= 16'd57; #30;
    in= 16'd64; #30;
    in= 16'd255; #30;
end

endmodule //parity_functions_tb