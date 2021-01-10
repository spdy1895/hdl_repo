`timescale 1ns/ 1ps
module SHIFTREG2 (
    output reg [4:0] data_out,
    output wire [3:0] LdCountValue,
    input wire [4:0] data_in,
    input wire s_in, clk, Ld, clr, sft
);

integer i;

always @(posedge clk) begin
    if(clr) data_out<= 0;
    else if(Ld) data_out<= data_in;
    else if(sft) data_out<= {s_in, data_out[4:1]};
end

assign LdCountValue= no_of_multiplier_digits(data_in);

function [3:0] no_of_multiplier_digits(input [4:0] datat_in);
    begin
        no_of_multiplier_digits= 3'b101;
        /*
        for (i= 4; i>= 0; i= i-1) begin
            if(data_in[i]!= 0) begin
                no_of_multiplier_digits= i+1;
                i= 0;
            end
        end
        */
    end
endfunction

endmodule //SHIFTREG2
