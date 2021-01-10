`include "d_latch_udp.v"
module d_latch (output wire q,
                input wire d, clk, clr    
);

d_latch_udp d0(q, d, clk, clr);

endmodule //d_latch