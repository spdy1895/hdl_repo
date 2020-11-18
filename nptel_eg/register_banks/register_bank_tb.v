`timescale 1ns/1ps 
`include "register_bank_v2.v"
`include "register_bank_v1.v"

module register_bank_tb (
    
);

wire [31:0] rdData1, rdData2;
reg [4:0] sr1, sr2, dr;
reg [31:0] wrData;
reg clk, write, reset;

integer k;

//register_bank_v1 v1(rdData1, rdData2, sr1, sr2, dr, wrData, clk, write);
//when instantiating the register bank v1
//remove the terminal reset.

register_bank_v2 v2(rdData1, rdData2, sr1, sr2, dr, wrData, clk, write, reset); 

initial begin
    clk= 1'b0;
    forever #5 clk= !clk;
end

initial begin
    $dumpfile("register_bank_tb.vcd");
    $dumpvars(0, register_bank_tb);

    #1 reset= 1'b1; write= 1'b0;
    #5 reset= 1'b0; 
end

initial begin
    #7 for (k=0; k<32; k=k+1) begin
        dr= k; wrData= (10*k); write= 1'b1;
        #10 write= 1'b0;
    end

    #20 for(k=0; k<32; k=k+2) begin
        sr1= k; sr2= k+1;
        #5;
        $display("reg[%2d]= %d, reg[%2d]= %d", sr1, rdData1, sr2, rdData2);
    end
    #50 $finish;
end

endmodule //register_bank_tb