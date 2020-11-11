//adder module to perform addition
module ADD (output reg [15:0] out,
            input wire [15:0] in1, in2
);

always @(*) begin
    out= in1 + in2;
end
endmodule //ADD