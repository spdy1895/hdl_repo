`timescale 1ns/1ps 
`include "pipe_ex2.v"
module pipe_ex2_tb (
    
);

wire [15:0] Zout;
reg [3:0] rs1, rs2, rd, func;
reg [7:0] addr;
reg clk1, clk2;
integer k;
  
pipe_ex2 p0(Zout, rs1, rs2, rd, func, addr, clk1, clk2);

initial begin
    clk1= 0; clk2= 0;
    repeat(20) begin
        #5 clk1= 1; #5 clk1= 0;
        #5 clk2= 1; #5 clk2= 0;
    end
end

initial begin
    for (k= 0; k<16; k=k+1) begin
        p0.regbank[k]= k;
    end
end

initial begin
    for (k= 0; k<16; k= k+1) begin
        $display(p0.regbank[k]);
    end
end

initial begin
    #3 {rs1, rs2, rd, func, addr}= {4'd10, 4'd5, 4'd10, 4'd5, 8'd125};
    #20 {rs1, rs2, rd, func, addr}= {4'd12, 4'd8, 4'd12, 4'd5, 8'd126};
    #20 {rs1, rs2, rd, func, addr}= {4'd13, 4'd5, 4'd14, 4'd0, 8'd128};
    #20 {rs1, rs2, rd, func, addr}= {4'd7, 4'd3, 4'd13, 4'd11, 8'd127};
    #20 {rs1, rs2, rd, func, addr}= {4'd9, 4'd5, 4'd15, 4'd1, 8'd129};
end

initial begin
    $dumpfile("pipe_ex2_tb.vcd");
    $dumpvars(0, pipe_ex2_tb);

    #150 $finish; 
end
endmodule