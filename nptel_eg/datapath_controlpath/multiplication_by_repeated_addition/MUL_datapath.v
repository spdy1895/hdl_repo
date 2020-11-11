//top module for instantiating the datapath
//funtional units.
/*
1.PIPO register A
2.PIPO register B
3.COUNTER B
4.ADDER
5.COMPARATOR
*/
`include "PIPO1.v"
`include "PIPO2.v"
`include "COUNTER.v"
`include "ADD.v"
`include "EQZ.v"

module MUL_datapath (output wire eqz,
                    output wire [15:0] MUL_output, 
                    input wire LdA, LdB, LdP,
                    clrP, decB, clk,
                    input wire [15:0] data_in
);

wire [15:0] X, Y, Z, Bout, Bus;

assign Bus= data_in;
assign MUL_output= Y;

PIPO1 A(X, Bus, LdA, clk);
PIPO2 P(Y, Z, LdP, clrP, clk);
COUNTER B(Bout, Bus, LdB, decB, clk);
ADD AD(Z, X, Y);
EQZ COMP(eqz, Bout);

endmodule //MUL_datapath