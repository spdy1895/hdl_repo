//*hdl module to show elaboration of generate conditional
module gen_con_multiplier #(parameter a0_width= 32, parameter a1_width= 32, parameter product_width= 64) (output wire [product_width-1:0] product,
        input wire [a0_width-1:0] a0,
        input wire [a1_width-1:0] a1
    
);

generate
    if((a0_width < 8) || (a1_width < 8))    cla_multiplier #(a0_width, a1_width) m0(product, a0, a1);
    else    tree_multiplier #(a0_width, a1_width) m0(product, a0, a1);
endgenerate

endmodule //gen_con_multiplier