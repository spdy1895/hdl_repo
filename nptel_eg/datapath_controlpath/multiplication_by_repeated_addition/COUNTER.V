//counter module for repeated addition
module COUNTER (output reg [15:0] dout,
                input wire [15:0] din,
                input wire ld, dec, clk
);

always @(posedge clk) begin
    if(ld) dout<= din;
    else if (dec) dout<= dout-1;
end

endmodule //COUNTER-