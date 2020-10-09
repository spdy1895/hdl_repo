//hdl module for a counter starting 
//from 5 to 67 and counter disables 
//once it reaches 67.
module counter_5to67 (output reg [7:0] count,
                        input wire clk
    
);

initial count= 8'd5;

always @(posedge clk) begin: counter
    forever @(posedge clk) begin
        if(count== 8'd67) begin
            disable counter;
        end
        count= count+1;
    end    
end

endmodule //counter_5to67