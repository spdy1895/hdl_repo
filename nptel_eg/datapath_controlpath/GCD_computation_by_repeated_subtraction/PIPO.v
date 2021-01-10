`timescale 1ns/1ps 
module PIPO (
    output reg [15:0] data_out,
    input wire [15:0] data_in,
    input wire load, clk 
);

always @(posedge clk) begin
    if(load) data_out<= data_in;
end

endmodule //PIPO