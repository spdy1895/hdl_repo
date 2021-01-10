//module for 8to1 mux
module mux_8to1 (output reg y,
                input  wire [7:0] i,
                input wire [2:0]sel
    
);

initial 
    $display("debuging complete!");

    always @(*) begin

        if (sel== 3'b000) y=i[0];
        else if (sel== 3'b001) y=i[1];
        else if (sel== 3'b010) y=i[2];
        else if (sel== 3'b011) y=i[3];
        else if (sel== 3'b100) y=i[4];
        else if (sel== 3'b101) y=i[5];
        else if (sel== 3'b110) y=i[6];
        else if (sel== 3'b111) y=i[7];
        else y=1'bx;
            
    end

endmodule //mux_8to1