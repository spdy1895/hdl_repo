//module for a micsellaneous logic expression

module misc (output reg y,
                input wire a,b,s0
    
);
 
reg c,d,s1;

initial
    $display("debuging complete!");

   always @(*) begin

    y=0;  
    s1=y; d=y;

    c= s1 ? a : b;
    y= s0 ? c : d;


   end

endmodule //misc