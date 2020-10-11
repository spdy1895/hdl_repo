//hdl module for ring counter description in 
//behavioral style
module ring_counter #(parameter N= 8)
(output reg [N-1:0] count,
input wire init, clk, left
    
);

always @(posedge clk) begin
    if(init) begin
        count[N-1]<= 1'b1;
        count[N-2:0]<= 0;
    end
    else if(left)begin
       count<= count<<1;
       count[0]<= count[N-1]; 
    end
    else begin
        count<= {count[0], count[N-1:1]};

    end
end

endmodule //ring_counter