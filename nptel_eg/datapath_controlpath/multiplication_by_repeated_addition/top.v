//top module to instantiate the fundamental blocks
`include "MUL_datapath.v"
`include "MUL_controller.v"

module top (output wire done,
            output wire [15:0] MUL_output, 
            input [15:0] data_in,
            input wire  start, clk
);

wire LdA, LdB, LdP, clrP ,decB, eqz;

MUL_controller CON (    .done(done),
                        .clk(clk),
                        .start(start),
                        .LdA(LdA),
                        .LdB(LdB),
                        .LdP(LdP),
                        .clrP(clrP),
                        .decB(decB),
                        .eqz(eqz)
                    );

MUL_datapath DAT (      .clk(clk),
                        .LdA(LdA),
                        .LdB(LdB),
                        .LdP(LdP),
                        .clrP(clrP),
                        .decB(decB),
                        .eqz(eqz),
                        .data_in(data_in),
                        .MUL_output(MUL_output)
                    );


endmodule //top