`timescale 1ns/ 1ps 
module SHIFTREG1 (
    output reg [4:0] data_out,
    input wire [4:0] data_in,
    input wire s_in, clk, Ld, clr, sft
);

always @(posedge clk) begin
    if(clr) data_out<= 0;
    else if(Ld) data_out<= data_in;
    else if(sft) data_out<= {s_in, data_out[4:1]};
end

endmodule //SHIFTREG1