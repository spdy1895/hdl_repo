//user defined primitive for d latch
primitive d_latch_udp(q, d, clk, clr);
output q;
reg q;
input d, clk, clr;
table
//  d   clk clr     q       q+
    ?   ?   1   :   ?   :   0;  //latch is cleared
    0   1   0   :   ?   :   0;  //latch is reset
    1   1   0   :   ?   :   1;  //latch is set
    ?   0   0   :   ?   :   -;  //latch is hold
endtable
endprimitive