`timescale 1ns/1ps 
`include "verilog_task.v"

module verilog_task_tb (
    
);
wire [15:0] ab_and, ab_or, ab_xor;
reg [15:0] a, b;

verilog_task t0 (ab_and, ab_or, ab_xor, a, b);

initial begin
    $dumpfile("verilog_task_tb.vcd");
    $dumpvars(0, verilog_task_tb);

    {a, b}= {16'd25, 16'd32}; #30;
    {a, b}= {16'd16, 16'd7}; #30;
end

endmodule //verilog_task_tb