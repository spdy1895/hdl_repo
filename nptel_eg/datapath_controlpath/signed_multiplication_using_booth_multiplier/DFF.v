`timescale 1ns/1ps 
module DFF (
    output reg q,
    input wire d, sft, clk, clr    
);

always @(posedge clk) begin
    if(clr) q<= 0;
    else if(sft) q<= d;
end

endmodule //DFF