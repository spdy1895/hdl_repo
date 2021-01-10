//hdl module for calculating factorial of a
//number using functions
module factorial (output reg [15:0] out,
    input wire [3:0] in
);
reg [15:0] temp;
always @(in) begin
    temp= 1;
    out= cal_fac(in);
end

function [15:0] cal_fac (input [3:0] in); begin
    while(in>1) begin
        temp= temp*in;
        in= in-1;
    end
    cal_fac= temp;
end
endfunction
endmodule //factorial