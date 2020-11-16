`timescale 1ns/1ps 
module COUNTER (
    output reg [3:0] data_out,
    input wire [3:0] LdCountValue,
    input wire decr, Ld, clk 
);

always @(posedge clk) begin
    if(Ld) data_out<= LdCountValue;
    else if (decr) data_out<= data_out-1;
end

endmodule //COUNTER