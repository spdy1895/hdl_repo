`timescale 1ns/1ps 
`include "force_release.v"
module force_release_tb (
    
);
wire out;
reg a, b, c;

force_release f0(out, a, b, c);

initial begin
    $dumpfile("force_release_tb.vcd");
    $dumpvars(0, force_release_tb);

    {a, b, c}= 3'b010; #30;
    force f0.w3= 1'b0; #30;
    release f0.w3;
end
endmodule //force_release_tb