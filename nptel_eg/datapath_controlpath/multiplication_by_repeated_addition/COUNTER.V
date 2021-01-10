//counter module for repeated addition
module COUNTER (output wire [15:0] dout,
                input wire [15:0] din,
                input wire ld, dec, clk
);
integer count;
always @(posedge clk) begin
    if(ld) count<= din;
    else if (dec) count<= count-1;
end
assign dout= count;
endmodule //COUNTER-