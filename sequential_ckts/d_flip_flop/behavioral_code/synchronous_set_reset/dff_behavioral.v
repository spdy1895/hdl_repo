//hdl module for dff written in behavioral style
//with synchronous set and reset.
module dff_behavioral (output reg q, 
                        output wire qbar,
                        input wire d, set, reset, clk    
);

assign qbar= ~q;

always @(posedge clk) begin
    if(reset==0) q<= 0;     //active low reset
    else if (set== 1) q<= 1;      //active high preset
    else q<= d;
end

endmodule //dff_behavioral