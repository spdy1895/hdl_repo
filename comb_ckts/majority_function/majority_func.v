//hdl module for majority function
//when 1's are in majority out is high
//else low 
module majority_func #(parameter N= 8) 
(output reg one,
input wire [N-1:0] in    
);

integer count= 0, i=0;
always @(*) begin
    while (i<N) begin
        if(in[i]) count= count+1;
        i= i+1;
    end       
    if(count>(N/2)) one= 1'b1;
    else one= 1'b0;
    count= 0;
    i= 0;
end

endmodule //majority_func