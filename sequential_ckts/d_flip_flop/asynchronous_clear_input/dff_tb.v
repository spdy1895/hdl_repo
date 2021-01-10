`timescale 1ns/1ps 
`include "dff.v"
module dff_tb (
    
);
wire q, qbar;
reg d, clk, clr;

dff d1(q, qbar, d, clk, clr);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
end

initial begin
    $dumpfile("dff_tb.vcd");
    $dumpvars(0, dff_tb);

    clr= 1'b1; #29;
    clr= 1'b0; d= 1'b1; #30; // set flip flop
    d= 1'b0; #30; //reset flip flop
    d= 1'b1; #28; //set flip flop
    clr= 1'b1; #30; //set clear to check behavior 
                    //towards asynchronous clear input
    $finish;

end

endmodule //dff_tb