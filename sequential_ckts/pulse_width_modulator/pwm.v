//module to get an output clock of period= 40 and a 25% duty cycle 
module pwm (output reg out_clk,
            input wire clk
    
);

integer i=0;

always @(negedge clk) begin
    if(i== 3) begin 
    out_clk= 1'b1;
    i= 0;
    end    
    else begin
    out_clk= 1'b0;
    i=i+1;    
    end
end
endmodule //pwm