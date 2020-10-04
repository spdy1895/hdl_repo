//hdl module to elaborate the use of  generate case
   `include "adder.v"
    module gen_case_add #(parameter N=4) (output wire [N-1:0] sum,
                                            output wire carry_out,
                                            input wire [N-1:0] in1, in2,
                                            input wire carry_in
        
    );
    
    generate
        case(N)
        1: adder #(1) adder1 (sum, carry_out, in1, in2, carry_in);
        2: adder #(2) adder2 (sum, carry_out, in1, in2, carry_in);
        3: adder #(3) adder3 (sum, carry_out, in1, in2, carry_in);
        default: adder adder4(sum, carry_out, in1, in2, carry_in);
        endcase
    endgenerate

    endmodule //gen_case_add