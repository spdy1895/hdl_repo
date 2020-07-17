`timescale 1ns/1ps
`include "xs3_st.v"
module xs3_tb (
    
);
    reg  B3,B2,B1,B0;
    wire E3,E2,E1,E0;

    //instantiate the design block
    xs3_st x1 (.b3(B3),.b2(B2),.b1(B1),.b0(B0),
                .e3(E3),.e2(E2),.e1(E1),.e0(E0)    
        );

        initial
        begin

            $dumpfile("xs3_tb.vcd");
            $dumpvars(0,xs3_tb);

            $display("debugging complete!");
            #1 B3=1'b1; B2=1'b0; B1=1'b0; B0=1'b0;
            //#1 $display ($time, "binary =%b \t xs3 =%b",B3,B2,B1,B0,E3,E2,E1,E0);

            #1 B3=1'b1; B2=1'b0; B1=1'b1; B0=1'b0;
            //#1 $display ($time, "binary =%b \t xs3 =%b",B3,B2,B1,B0,E3,E2,E1,E0);

        end

endmodule //xs3_tb