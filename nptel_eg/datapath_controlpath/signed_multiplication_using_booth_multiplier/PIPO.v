`timescale 1ns/1ps 
module PIPO (
    output reg [4:0] data_out,
    input wire [4:0] data_in,
    input wire clk, load 
);
//data_in is the multiplicand
integer i;
always @(posedge clk) begin
    if(load) data_out<= data_in;
end
endmodule //PIPO