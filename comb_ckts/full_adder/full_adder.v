//module for full adder
module full_adder (output reg sum,carry,
                    input wire a,b,c_in
    
);

initial
    $display("debugging complete!");

    always @(*) begin
        
        sum= (a^b^c_in);
        carry= ((a&b)|(b&c_in)|(a&c_in)); 

    end

endmodule //full_adder