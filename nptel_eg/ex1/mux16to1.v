//hdl module for multiplexer 16 to 1
module mux16to1 (output wire out, 
                input wire [15:0] in,
                input wire [3:0] sel
    
);

assign out= in[sel];
endmodule //mux16to1