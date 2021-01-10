//hdl module for synchronous counter using
//user defined primitive jk flip-flop
`include "jkff_udp.v"
module sync_counter (output wire [3:0] count,
                    input wire en, clock,clear 
    
);

wire w1, w2, w3;

and (w1, en, count[0]);
and (w2, count[1], w1);
and (w3, count[2], w2);

jkff_udp j0(count[0], en, en, clock, clear);
jkff_udp j1(count[1], w1, w1, clock, clear);
jkff_udp j1(count[2], w2, w2, clock, clear);
jkff_udp j1(count[3], w3, w3, clock, clear);

endmodule //sync_counter