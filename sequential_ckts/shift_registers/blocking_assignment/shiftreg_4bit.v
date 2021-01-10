//hdl module for 4-bit shift register
module shiftreg_4bit (output reg e,
                        input wire a, clk, clear
    
);

reg b, c, d;

always @(posedge clk or negedge clear) begin
    if(!clear) {b, c, d}= {1'b0, 1'b0, 1'b0};        //active low clear
    else begin
        e= d;
        d= c;
        c= b;
        b= a;
    end
        
end

endmodule //shiftreg_4bit