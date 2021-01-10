//module for 4 bit magnitude comparator
module mag_comp (output reg e,g,l,
                input wire [3:0] a,b
    
);

initial
    $display("debugging complete!");

always @(*) begin
    if (a>b) begin
        e=1'b0; g=1'b1; l=1'b0; 
    end

    else if (a<b) begin
        e=1'b0; g=1'b0; l=1'b1;
    end
    
    else begin
        e=1'b1; g=1'b0; l=1'b0;
    end
end

endmodule //mag_comp