//hdl module for transistor level modelng 
//for nor switch
module nor_switch (output wire out,
                    input wire a, b
    
);

wire c;
supply1 vdd;
supply0 gnd;

//instantiate pmos switch
pmos(c, vdd, b);
pmos(out, c, a);

//>instantiate nmos switch
nmos(out, gnd, a);
nmos(out, gnd, b);

endmodule //nor_switch