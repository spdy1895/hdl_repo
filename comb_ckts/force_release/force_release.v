//hdl module to demonstrate the use of force and
//release, "procedural continuous assignmnet".
module force_release (output wire out,
                        input wire a, b,c
    
);

wire w0, w1, w2, w3;
//some arbitrary circuit
and g0(w0, a, b);
xor g1(w1, w0, c);
or g2(w2, w0, w1);
nand g3(w3, w2, w1);
xnor g4(out, w2, w3);

endmodule //force_release