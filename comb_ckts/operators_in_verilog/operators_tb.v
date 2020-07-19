//testbench for operators module
`timescale 1ns/1ps
//`include "operators.v"

module operators_tb (
    
);

wire [3:0] Z;
reg [3:0] A,B;

operators o1( , ,A,B);

initial begin

    A= 4'b1010;
    B= 4'b0101;
    $display("testbench debugging complete!");

end

endmodule //operators_tb