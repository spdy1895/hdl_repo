//shift register to hold value of P
module PIPO2 (output reg [15:0] dout,
            input wire [15:0] din,
            input wire ld, clr, clk
);

always @(posedge clk) begin
    if(clr) dout<= 16'd0;
    else if (ld) dout<= din;
end 

endmodule //PIPO2