//testbench 
`timescale 1ns/1ps 
`include "named_event.v"

module named_event_tb (
    
);
wire [3:0] out;
reg [3:0] in1, in2;
reg in0, clk;

named_event n1(out, in1, in2, in0, clk);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("named_event_tb.vcd");
    $dumpvars(0,named_event_tb);

    in1= 1001; in2= 1101; #10;
    in0= 1; #30;
    in0= 0; #30;
    $finish;
end

endmodule //named_event_tb