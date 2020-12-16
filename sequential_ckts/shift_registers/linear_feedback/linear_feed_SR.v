`timescale 1ns/1ps
//Description: A linear feedback shift register whose first input is 
//              XOR of current inputs from ff[0] and ff[3]. This design will 
//              generate 4 bit all possible sequences execpt 0000.
//
module linear_feed_SR (
    output wire [3:0] out, 
    input wire clk, clear
);

reg [3:0] Sft_Reg;

assign out= Sft_Reg;

always @(posedge clk) begin
    if (!clear) Sft_Reg<= 4'b1000;
    else begin
    Sft_Reg[3]<= Sft_Reg[2];
    Sft_Reg[2]<= Sft_Reg[1];
    Sft_Reg[1]<= Sft_Reg[0];
    Sft_Reg[0]<= (Sft_Reg[3] ^ Sft_Reg[0]);
    end
end

endmodule //linear_feed_SR