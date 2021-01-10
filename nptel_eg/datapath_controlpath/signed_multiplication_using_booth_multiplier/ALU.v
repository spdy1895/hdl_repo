`timescale 1ns/1ps 
module ALU (
    output reg [4:0] out,
    input wire [4:0] in1, in2,
    input wire add_sub, EnableALU
);

always @(EnableALU) begin
    if(add_sub==0) out= in1-in2;
    //add when active high
    else out= in1+in2;
end
endmodule //ALU