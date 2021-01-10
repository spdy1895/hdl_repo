//module for 4 to1 mux
module mux_4to1 (output reg y,
                input wire [3:0] i,
                input wire [1:0]sel
    
);

initial
    $display("debugging complete!");

always @(*) begin
    
    case (sel)

        2'b00: y=i[0];
        2'b01: y=i[1];
        2'b10: y=i[2];
        2'b11: y=i[3];
        default : y=1'bx; 

    endcase
end

endmodule //mux_4to1