`timescale 1ns/1ps
`include "boolean_alu.v"
module boolean_alu_tb (
    
);
wire [4:0] out;
reg [3:0] in1, in2;
reg [2:0] select;

boolean_alu b1(out, in1, in2, select);

initial begin
    $dumpfile("boolean_alu_tb.vcd");
    $dumpvars(0, boolean_alu_tb);

    in1= 4'b1010; in2= 4'b0101; #30;
    select= 3'b000; #30;
    select= 3'b001; #30;
    select= 3'b010; #30;
    select= 3'b011; #30;
    select= 3'b100; #30;
    select= 3'b101; #30;
    select= 3'b110; #30;
    select= 3'b111; #30;
end

endmodule //boolean_alu_tb 