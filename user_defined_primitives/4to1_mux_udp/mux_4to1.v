`include "mux_4to1_udp.v"
module mux_4to1 (output wire f,
                input wire s1, s0, in0, in1, in2, in3
    
);

mux_4to1_udp m0(f, s1, s0, in0, in1, in2, in3);

endmodule //mux_4to1