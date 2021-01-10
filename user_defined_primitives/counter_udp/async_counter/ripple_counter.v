//ripple counter using user defined primitive
`include "tff_udp.v"

    module ripple_counter (output wire [5:0] count,
                            input wire en, clock, clear  
        
    );

    tff_udp t0(count[0], en, ~clock, clear);
    tff_udp t1(count[1], en, ~count[0], clear);
    tff_udp t2(count[2], en, ~count[1], clear);
    tff_udp t3(count[3], en, ~count[2], clear);
    tff_udp t4(count[4], en, ~count[3], clear);
    tff_udp t5(count[5], en, ~count[4], clear);

    endmodule //ripple_counter