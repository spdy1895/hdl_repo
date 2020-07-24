//module for priority encoder
module pri_encoder ( output reg[2:0] out,
                    input wire [7:0] in
    
);

integer i;

initial 
$display("debugging complete!");
always @(*) begin
    
    for (i=7; i>=0; i=i-1)
    begin: block
            if(in[i]==1) begin
            out= i;
            disable block;
            end
    end


end

endmodule //pri_encoder