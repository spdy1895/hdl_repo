`timescale 1ns/1ps
//4x32 register file
module register_bank_v1 (
    output reg [31:0] rdData1, rdData2,
    input wire [1:0] sr1, sr2, dr,
    input wire [31:0] wrData,
    input clk, write
);

reg [31:0] R0, R1, R2, R3;

always @(*) begin
    case(sr1)
    00: rdData1= R0;
    01: rdData1= R1;
    10: rdData1= R2;
    11: rdData1= R3;
    default: rdData1= 32'hxxxx_xxxx;
    endcase
end

always @(*) begin
    case (sr2)
        00: rdData2= R0;
        01: rdData2= R1;
        10: rdData2= R2;
        11: rdData2= R3; 
        default: rdData2= 32'hxxxx_xxxx;
    endcase
end

always @(posedge clk) begin
    if(write) begin
        case (dr)
            00: R0<= wrData;
            01: R1<= wrData;
            10: R2<= wrData;
            11: R3<= wrData;
        endcase
    end
end

endmodule //register_bank_v1