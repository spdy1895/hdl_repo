`timescale 1ns/1ps 
`include "dff_behavioral.v"

module dff_behavioral_tb (
    
);

wire q, qbar;
reg d, set, reset, clk;

dff_behavioral d0(q, qbar, d, set, reset, clk);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("dff_behavioral_tb.vcd");
    $dumpvars(0,dff_behavioral_tb);

    reset= 1'b0; #30;
    reset= 1'b1; set= 1'b1;   #30;
    set= 1'b0; d= 1'b0;    #30;
    d= 1'b1;    #30;
    d= 1'b0; set= 1'b1; #30;
    #30 $finish;
        
end

endmodule //dff_behavioral_tb