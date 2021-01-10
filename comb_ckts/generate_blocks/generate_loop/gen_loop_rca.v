//module for ripple carry adder using generate loop
module gen_loop_rca (output wire [3:0]sum,
                    output wire carry_out,
                    input wire [3:0] in1, in2,
                    input wire carry_in
    
);

parameter N=4;

wire [N:0] carry;

assign carry_out= carry[N];

genvar i;

generate
    for (i=0 ;i<4 ;i=i+1 ) begin: r_loop
    wire t1, t2, t3;
    xor g1(t1, in1[i], in2[i]);
    xor g2(sum[i], t1, carry[i]);
    and g3(t2, in1[i], in2[i]);
    and g4(t3, t1, carry[i]);
    or g5(carry[i+1], t2, t3);       
    end
endgenerate
assign carry[0]= carry_in;

endmodule //gen_loop_rca