//module for comparing the output of comparator
module EQZ (output wire eqz,
            input wire [15:0] data
);
assign eqz= (data==1);
endmodule //EQZ