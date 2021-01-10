//>master-slave negative edge-triggered
//-d flip flop with 
//=synchronous clear input.
module dff (output wire q, qbar,
            input wire d, clk, clr
    
);

wire w1, w2, w3, w4, w5, w6;

not g1(_clk, clk);
not g2(_clr, clr);
not g3(_d, d);

//master latch
nand g4(w1, d, _clr, clk);
nand g5(w2, clk, _d);
nand g6(w3, w1, w4);
nand g7(w4, w3, _clr, w2);

//slave latch
nand g8(w5, w3, _clk);
nand g9(w6, _clk, w4);
nand g10(q, w5, qbar);
nand g11(qbar, q, w6);

endmodule //dff