`timescale 1ns/1ps 
`include "majority_func.v"
module majority_func_tb (
    
);
wire one;
reg [N-1:0] in;
parameter N= 8;

majority_func m0(one, in);

initial begin
    $dumpfile("majority_func_tb.vcd");
    $dumpvars(0, majority_func_tb);

    in= 8'b1010_0100; #30;
    in= 8'b1011_1111; #30;
    in= 8'b1100_0000; #30;
    
    $finish;
end

endmodule //majority_func_tb