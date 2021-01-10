`timescale 1ns/1ps 
module pipe_ex2 (
    output wire [15:0] Zout,
    input wire [3:0] rs1, rs2, rd, func,
    input wire [7:0] addr,
    input wire clk1, clk2
);

reg [15:0] L12_A, L12_B, L23_Z, L34_Z;
reg [3:0] L12_rd, L12_func, L23_rd;
reg [7:0] L12_addr, L23_addr, L34_addr;
reg [15:0] regbank [0:15];
reg [15:0] mem [0:255];

parameter   zero= 4'd0,
            one= 4'd1,
            two= 4'd2,
            three= 4'd3,
            four= 4'd4,
            five= 4'd5,
            six= 4'd6,
            seven= 4'd7,
            eight= 4'd8,
            nine= 4'd9,
            ten= 4'd10,
            eleven= 4'd11;

assign Zout= L34_Z;

//stage 1
always @(posedge clk1) begin
    L12_A<= regbank[rs1];
    L12_B<= regbank[rs2];
    L12_rd<= rd;
    L12_func<= func;
    L12_addr<= addr;
end

//stage 2
always @(negedge clk2) begin
    case (L12_func)
        zero: L23_Z<= L12_A + L12_B;
        one: L23_Z<= L12_A - L12_B;
        two: L23_Z<= L12_A * L12_B;
        three: L23_Z<= L12_A;
        four: L23_Z<= L12_B;
        five: L23_Z<= L12_A & L12_B;
        six: L23_Z<= L12_A | L12_B;
        seven: L23_Z<= L12_A ^ L12_B;
        eight: L23_Z<= -L12_A;
        nine: L23_Z<= -L12_B;
        ten: L23_Z<= L12_A>>1;
        eleven: L23_Z<= L12_A<<1;
        default: L23_Z<= 16'hxxxx;
    endcase
    L23_rd<= L12_rd;
    L23_addr<= L12_addr;
end

//stage 3
always @(posedge clk1) begin
    regbank[L23_rd]<= L23_Z;
    L34_Z<= L23_Z;
    L34_addr<= L23_addr;
end

//stage 4
always @(negedge clk2) begin
    mem[L34_addr]<= L34_Z;
end

endmodule //pipe_ex2