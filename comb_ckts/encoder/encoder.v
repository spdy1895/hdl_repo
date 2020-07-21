//module for 8 bit encoder
module encoder (output reg [2:0] y,
                input wire [7:0] i
    
);

initial 
    $display("debugging complete!");

    always @(*) begin

        if(i==8'b0000_0001) y=3'b000;
        else if(i==8'b0000_0010) y=3'b001;
        else if(i==8'b0000_0100) y=3'b010;
        else if(i==8'b0000_1000) y=3'b011;
        else if(i==8'b0001_0000) y=3'b100;
        else if(i==8'b0010_0000) y=3'b101;
        else if(i==8'b0100_0000) y=3'b110;
        else if(i==8'b1000_0000) y=3'b111;
    end 

endmodule //encoder