//module for 3 to 8 decoder
module decoder_3to8 (output reg [7:0] out,
                    input wire [2:0] in
    
);

initial 
    $display("debugging complete!");

integer i;

always @(*) begin

    out=8'b0000_0000;

    for(i=0; i<8; i=i+1)begin

            if(i==in)begin
                out[i]= 1'b1;
            end
    end
    
end

endmodule //decoder_3to8