`timescale 1ns/1ps
//`include "xs3_df.v"
//testbench for xs3 code converter dataflow description 
module xs3_df_tb (
    
);

wire E3,E2,E1,E0;
reg B3,B2,B1,B0;

xs3_df x1(E3,E2,E1,E0,B3,B2,B1,B0);

initial
begin
    $dumpfile("xs3_df_tb.vcd");
    $dumpvars(0,xs3_df_tb);

    #1 {B3,B2,B1,B0}=4'b1001; 

    #1 {B3,B2,B1,B0}=4'b0101;
    $display("debugging complete!");
end

endmodule //xs3_df_tb