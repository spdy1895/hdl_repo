//user defined primitive for 4 to 1 mux
primitive mux_4to1_udp(f, s1, s0, in0, in1, in2, in3);
output f;
input s1, s0, in0, in1, in2, in3;

table
//  s1  s0  in0 in1 in2 in3     f
    0   0   0   ?   ?   ?   :   0;
    0   0   1   ?   ?   ?   :   1;
    0   1   ?   0   ?   ?   :   0;
    0   1   ?   1   ?   ?   :   1;
    1   0   ?   ?   0   ?   :   0;
    1   0   ?   ?   1   ?   :   1;
    1   1   ?   ?   ?   0   :   0;
    1   1   ?   ?   ?   1   :   1;   

endtable
endprimitive