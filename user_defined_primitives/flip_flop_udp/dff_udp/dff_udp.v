//user defined primitive for d flip flop
primitive dff_udp(q, d, clock, clear); 
output q;
reg q;
input d, clock, clear;
table
    ?   ?   1   :   ?   :   0;  //clear activated
    ?   ?   (10)    :   ?   :   -;  //ignore negede of clear

    1   (01)    0   :   ?   :   1;  //at posedge set flip-flop
    0   (01)    0   :   ?   :   0;  //at posedge reset flip-flop

    ?   (0x)    0   :   ?   :   -;  //hold value of q for posedge transition

    ?   (1?)    0   :   ?   :   -;  //ignore negative transition of clock
    ?   (x0)    0   :   ?   :   -;  //ignore negative transition of clock 

    (??)    ?   0   :   ?   :   -;  //ignore any change in d when clock is steady;   
    endtable
endprimitive