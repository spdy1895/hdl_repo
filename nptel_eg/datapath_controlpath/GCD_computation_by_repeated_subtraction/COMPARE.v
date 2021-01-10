`timescale 1ns/1ps 
module COMPARE (
    output wire lt, gt, eq, 
    input wire [15:0] data1, data2
);

assign lt= data1<data2;
assign gt= data1>data2;
assign eq= data1==data2;
endmodule //COMPARE