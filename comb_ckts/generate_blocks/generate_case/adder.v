module adder #(parameter N= 4) (output wire [N-1:0] sum,
                                output wire carry_out,
                                input wire [N-1:0] in1, in2,
                                input wire carry_in
    
);

wire [N:0] carry;

assign carry[0]= carry_in;
assign  carry_out= carry[N];

genvar i;

generate
    for (i= 0; i<N ; i= i+1) begin: r_loop
    wire t1, t2, t3;
    xor g1(t1, in1[i], in2[i]);
    xor g2(sum[i], t1, carry[i]);
    and g3(t2, in1[i], in2[i]);
    and g4(t3, t1, carry[i]);
    or g5(carry[i+1], t2, t3);        
    end
endgenerate

endmodule //adder