//module to describe d latch using wait statement
module d_latch (output reg q,
                input d, clk
    
);

always @(clk) begin
    if(!clk) q<= q;
    wait(clk) q<= d;
end

endmodule //d_latch