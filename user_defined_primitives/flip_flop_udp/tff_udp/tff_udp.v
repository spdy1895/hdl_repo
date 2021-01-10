//user defined primitive for t flip flop
primitive tff_udp(q, t, clock, clear); 
output q;
reg q; kz
input t, clock, clear;
initial q=1'b0;
table
    ?   ?   1   :   ?   :   0;  //clear activated
    ?   ?   (10)    :   ?   :   -;  //ignore negede of clear

    1   (01)    0   :   0   :   1;  //at posedge toggle flip-flop
    1   (01)    0   :   1   :   0;  //at posedge toggle flip-flop

    0   (01)    0   :   ?   :   -;  //at posedge hold flip-flop

    ?   (1?)    0   :   ?   :   -;  //ignore negative transition of clock
    ?   (x0)    0   :   ?   :   -;  //ignore negative transition of clock 

    (??)    ?   0   :   ?   :   -;  //ignore any change in t when clock is steady;   
    
    
    endtable
endprimitive