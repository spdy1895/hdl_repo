`timescale 1ns/1ps 
`include "factorial.v"
module factorial_tb (
    
);
wire [15:0] out;
reg [3:0] in;

factorial f0(out, in);

initial begin
    $dumpfile("factorial_tb.vcd");
    $dumpvars(0, factorial_tb);

    in= 4'd7; #30;
    in= 4'd5; #30;
end

endmodule //factorial_tb