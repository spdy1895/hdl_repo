//hdl module for parity generator
module parity_gen (output reg parity, 
                    input wire clk, in
    
);

reg even_odd;
parameter EVEN= 0, ODD= 1;

initial even_odd= 0;

always @(posedge clk) begin
    case (even_odd)
        EVEN: even_odd<= (in ? ODD : EVEN);
        ODD: even_odd<= (in ? EVEN : ODD);  
        default: even_odd<= EVEN;
    endcase
end

always @(even_odd) begin
    case (even_odd)
        EVEN: parity= 0;
        ODD: parity= 1; 
        default: parity= 1'bx;
    endcase
end

endmodule //parity_gen