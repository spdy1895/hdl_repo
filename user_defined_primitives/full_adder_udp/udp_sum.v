//user defined primitive for full adder 
primitive udp_sum(
    sum,
    a, b, c_in
);
output sum;
input a, b, c_in; 

table
    // a    b   c   sum
        0   0   0   :   0;
        0   0   1   :   1;
        0   1   0   :   1;
        0   1   1   :   0;
        1   0   0   :   1;
        1   0   1   :   0;
        1   1   0   :   0;
        1   1   1   :   1;   
endtable

endprimitive