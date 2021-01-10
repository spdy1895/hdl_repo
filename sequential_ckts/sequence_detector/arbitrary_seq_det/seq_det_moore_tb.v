//testbench for the user defined sequence detector moore type
`timescale 1ns/1ps 
`include "seq_det_moore.v"

module seq_det_moore_tb (
    
);

wire out;
reg in, rst, clk;
reg [3:0] sequence;

seq_det_moore s1(out, in, rst, clk, sequence);

always begin
    clk= 1'b0; #5;
    clk= 1'b1; #5;
end

initial begin
    $dumpfile("seq_det_moore_tb.vcd");
    $dumpvars(0, seq_det_moore_tb);

    $monitor($time, "\t reset=%b \t sequence=%b \tin=%b \t ",
    rst, sequence[3:0], in);

    sequence= 4'b1010;
    rst= 1'b1; #30;
    {rst, in}= {1'b0, 1'b1}; #10;
    
    in= 1'b0; #10;
    in= 1'b1; #10;
    in= 1'b0; #10;
    in= 1'b1; #10;
    in= 1'b1; #10;
    in= 1'b1; #10;
    in= 1'b1; #10;
    in= 1'b1; #10;
    in= 1'b1; #10;
    in= 1'b0; #10;
    in= 1'b1; #10;
    in= 1'b0; #10;
    #20;
    $finish;

end

endmodule //seq_det_moore_tb