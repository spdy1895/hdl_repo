//hdl module for up-down counter with synchronous 
//clear input.
module counter (output reg [7:0] count,
                input wire [7:0] load_count,
                input mode, clr, ld, clk
    
);

always @(posedge clk) begin
    if(ld) count<= load_count;
    else if(clr) count<= 0;
    else if(mode) count<= count+1;
    else count<= count-1;
end

endmodule //counter