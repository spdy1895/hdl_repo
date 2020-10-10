//module to describe d latch using wait statement
module d_latch (output reg q,
                input d, enable
    
);

always @(enable or d) begin
    if(!enable) q<= q;
    wait(enable) q<= d;
end

endmodule //d_latch