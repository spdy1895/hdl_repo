//hdl module for 4-bit counter with asynchronous reset
module counter (output reg [3:0] count,
                input wire reset, clk
    
);

always @(posedge clk or posedge reset) begin
    if(reset) count<= 4'b0000;
    else count<= count+1;
end

endmodule //counter 