//module for adder cum subtractor
`include "full_adder.v"
module add_sub (output wire [3:0] result,
                output wire carry,
                input wire [3:0] a,b,
                input wire c0 
    
);


initial 
    $display("debugging complete for adder cum subtractor!");


parameter initialcarry= 1'b0;

wire c1,c2,c3;

full_adder f0(result[0], c1, a[0], b[0], initialcarry, c0);
full_adder f1(result[1], c2, a[1], b[1], c1, c0);
full_adder f2(result[2], c3, a[2], b[2], c2, c0);
full_adder f3(result[3], carry, a[3], b[3], c3, c0);


endmodule //add_sub