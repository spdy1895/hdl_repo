//module for bcd adder
module bcd_adder (output reg [4:0] res,
                input wire [3:0] a,b
    
);

always @(*) begin

    $display("BCD adder");

    if((a <= 4'b1001) && (b <= 4'b1001)) begin
        
        res= a + b;
            if(res > 5'b01001)
            res= res + 5'b00110;
        

    end

    else if ( (a > 4'b1001) || (b > 4'b1001) ) begin
        
        $display("invalid BCD!");
        res= 5'bxxxxx;
    end
    
end

endmodule //bcd_adder