//user defined primitive for full adder carry
primitive udp_carry(
    c_out,
    a, b, c_in 
);
output c_out;
input a, b, c_in; 

table
    //  a   b   c       carry
        0   0   0   :   0;
        0   0   1   :   0;
        0   1   0   :   0;
        0   1   1   :   1;
        1   0   0   :   0;
        1   0   1   :   1;
        1   1   0   :   1;
        1   1   1   :   1;    
endtable

endprimitive