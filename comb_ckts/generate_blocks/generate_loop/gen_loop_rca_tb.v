`timescale 1ns/1ps 
`include "gen_loop_rca.v"
module gen_loop_rca_tb (
    
);

wire [3:0] sum;
wire carry_out;
reg [3:0] in1, in2;
reg carry_in;

gen_loop_rca r1(sum, carry_out, in1, in2, carry_in);

initial begin
    $dumpfile("gen_loop_rca_tb.vcd");
    $dumpvars(0,gen_loop_rca_tb);

    in1= 4'b0100; in2= 4'b1010; carry_in= 0; #20;
    in1= 4'b1001; in2= 4'b1011; carry_in= 0; #20;
end

endmodule //gen_loop_rca_tb