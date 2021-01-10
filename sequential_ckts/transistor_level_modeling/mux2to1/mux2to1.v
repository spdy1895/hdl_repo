//hdl module to demonstrate transistor level modeling
//for 2 to 1 multiplexer
module mux2to1 (output wire out,
                input wire i0, i1, select    
);

cmos (out, i0, ~select, select);
cmos (out, i1, select, ~select);

endmodule //mux2to1