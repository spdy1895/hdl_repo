`timescale 1ns/1ps 
`include "pwm.v"

module pwm_tb (
    
);

wire out_clk;
reg clk;

pwm p1(out_clk, clk);
 
initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("pwm_tb.vcd");
    $dumpvars(0, pwm_tb);

    #200 $finish;
end

endmodule //pwm_tb