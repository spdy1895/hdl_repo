`timescale 1ns/1ps 
`include "memory_file.v"
`define READ 1
module memory_file_tb (
    
);
reg [7:0] number;
integer mcd;
memory_file m0();

initial begin
    mcd= $fopen("memory.mem");
    repeat(8) begin
        number= $random;
        $fdisplayb(mcd, number);
    end
    $fclose(mcd);
end

endmodule //memory_file_tb