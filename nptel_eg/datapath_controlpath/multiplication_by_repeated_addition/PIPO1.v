//shift register to hold value of A
module PIPO1 (output reg [15:0] dout, 
            input wire [15:0] din,
            input wire ld, clk
);
always @(posedge clk ) begin
    if(ld) dout<= din;
end
endmodule //PIPO1