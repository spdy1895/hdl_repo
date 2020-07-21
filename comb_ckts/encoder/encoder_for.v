//module for encoder using for loop-tricky
module encoder_for (output reg [2:0] y,
                    input  wire [7:0] i 
    
);

reg [7:0] test;
integer j;
initial 
    $display("debugging complete!");

    always @( *) begin:encoder

        test=8'b0000_0001;

        for (j =0 ;j<8 ; j=(j+1)) begin
            if (i==test) begin
                y=j;
            end
            
            test= test << 1;
            
        end
        
    end

endmodule //encoder_for