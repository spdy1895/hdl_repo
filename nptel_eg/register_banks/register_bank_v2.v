//32x32 register file
module register_bank_v2 (
    output wire [31:0] rdData1, rdData2,
    input  wire [4:0] sr1, sr2, dr,
    input wire [31:0] wrData,
    input wire clk, write, reset
);

integer k;
reg [31:0] regfile [0:31];

assign rdData1= regfile[sr1];
assign rdData2= regfile[sr2];

always @(posedge clk) begin
    if (reset) begin
        for (k=0; k<32; k=k+1) begin
            regfile[k]<= 0;
        end
    end
    else if(write)
    regfile[dr]<= wrData;
end

endmodule //register_bank_v2