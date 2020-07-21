//excess3 code converter using dataflow description
module xs3_df (
    output wire e3,e2,e1,e0,
    input wire  b3,b2,b1,b0
);

assign e0= ~b0;
assign e1= ~(b1^b0);
assign e2= (~b2)&(b1+b0) + (b2)&(~b1)&(~b0);
assign e3= b3 + b2&(b1+b0);

//initial 
//    $display("debugging complete!");
endmodule //xs3_df