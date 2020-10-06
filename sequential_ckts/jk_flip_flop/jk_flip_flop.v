//module for jk fliop-flip using structural modelling
//negative edge triggered 
module jk_flip_flop (output wire q, qbar,
                input wire _clr, j, k, clk
    
);

//declaration of intermediate wires
wire a, b, c, d, e, f, clkbar;

//getting inverted clk for slave latch 
not (clkbar, clk);

//defining slave latch
nand n0(q, e, qbar);
nand n1(qbar, f, _clr, q);
nand n2(e, c, _clr, clk);
nand n3(f, d, clk);

//defining master latch
nand n4(c, a, d);
nand n5(d, b, c, _clr);
nand n6(a, j, clkbar, qbar, _clr);
nand n7(b, k, clkbar, q);


endmodule //jk_flip_flop