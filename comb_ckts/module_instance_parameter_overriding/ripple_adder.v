//ripple carry adder 4-bit
`include "full_adder.v"
module ripple_adder (output wire [3:0] sum,
                        output wire carry_out,
                        input  wire [3:0] a, b,
                        input wire c_in 
    
);

wire c1, c2, c3;

//instantiate four 1-bit full adder
full_adder #(1, 1) f0(sum[0], c1, a[0], b[0], c_in);
full_adder #(2, 2) f1(sum[1], c2, a[1], b[1], c1);
full_adder #(3, 3) f2(sum[2], c3, a[2], b[2], c2);
full_adder #(4, 4) f3(sum[3], carry_out, a[3], b[3], c3); 

endmodule //ripple_adder