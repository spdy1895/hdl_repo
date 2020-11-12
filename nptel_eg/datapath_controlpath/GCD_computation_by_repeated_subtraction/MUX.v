`timescale 1ns/1ps 
module MUX (
    output wire [15:0] out,
    input wire [15:0] in0, in1,
    input wire sel 
);

assign out= sel ? in1 : in0;

endmodule //MUX