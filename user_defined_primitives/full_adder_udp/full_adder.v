//hdl module for full adder using 
//user defined primitives for adder
//and carry.
`include "udp_sum.v"
`include "udp_carry.v"

module full_adder (output wire sum, carry,
                    input wire a, b, c_in
    
);

udp_sum udp0(sum, a, b, c_in);
udp_carry udp1(carry, a, b, c_in);

endmodule //full_adder