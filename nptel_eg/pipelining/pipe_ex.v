`timescale 1ns/1ps
//verilog code for pipeline modeling
module pipe_ex #(parameter N= 10) (
    output wire [N-1:0] F,
    input wire [N-1:0] A, B, C, D,
    input wire clk 
);

reg [N-1:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L34_F;

assign F= L34_F;
//using separate always block
//**stage 1**
always @(posedge clk) begin
    L12_x1<= A+B;
    L12_x2<= C-D;
    L12_D<= D;
    end

//**stage 2**
always @(posedge clk) begin
    L23_x3<= L12_x1+L12_x2;
    L23_D<= L12_D;
end

//**stage 3**
always @(posedge clk) begin
    L34_F<= L23_x3*L23_D;
end

endmodule //pipe_ex