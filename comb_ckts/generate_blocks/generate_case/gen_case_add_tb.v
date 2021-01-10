`timescale 1ns/1ps 
`include "gen_case_add.v"
module gen_case_add_tb (
    
);
parameter N=3;
wire [N-1:0] sum;
wire carry_out;
reg [N-1:0] in1, in2;
reg carry_in;

gen_case_add a1 (sum, carry_out, in1, in2, carry_in);
defparam a1.N=3;

initial begin

    $dumpfile("gen_case_add_tb.vcd");
    $dumpvars(0,gen_case_add_tb);
    carry_in= 0; in1= 4'b1010; in2= 4'b0101; #50;
end

endmodule //gen_case_add_tb