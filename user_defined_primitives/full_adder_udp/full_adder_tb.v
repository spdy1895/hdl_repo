`timescale 1ns/1ps 
`include "full_adder.v"

module full_adder_tb (
    
);

wire sum, carry;
reg a, b, c_in;

full_adder f0(sum, carry, a, b, c_in);

initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars(0, full_adder_tb);

    {a, b, c_in}= 3'b000; #30;
    {a, b, c_in}= 3'b001; #30;
    {a, b, c_in}= 3'b010; #30;
    {a, b, c_in}= 3'b011; #30;
    {a, b, c_in}= 3'b100; #30;
    {a, b, c_in}= 3'b101; #30;
    {a, b, c_in}= 3'b110; #30;
    {a, b, c_in}= 3'b111; #30;

end

endmodule //full_adder_tb