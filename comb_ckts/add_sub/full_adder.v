//module for full adder
module full_adder (output reg sum,ncarry,
                    input wire  a,b,pcarry,c_in
    
);

initial
    $display("debugging complete for full adder!");


always @(a,b,c_in,pcarry) begin
  
    if(c_in==1) begin

        $display("subtraction mode");
        sum= (a^b^pcarry);
        ncarry= (((~a)&b) | ((~a)&pcarry) | (b&pcarry));

    end

    else begin
        $display("addition mode");
        sum= (a^b^pcarry);
        ncarry= ((a&b)|(a&pcarry)|(b&pcarry));
    end
       
end

endmodule //full_adder