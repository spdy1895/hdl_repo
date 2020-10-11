//hdl module for parametrized design counter an N-bit counter
module counter #(parameter N= 8) 
(output reg [N-1:0] count,
input wire clk, clear   
);

always @(posedge clk) begin
    if(clear) count<= 0;
    else count<= count+1;
end

endmodule //counter