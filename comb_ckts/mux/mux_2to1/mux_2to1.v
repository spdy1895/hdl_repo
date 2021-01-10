//multiplexer 2 to 1
//with continuous assignment
module mux_2to1 ( output y, 
                    input  a,b,sel
    
);

assign y =  sel ? a : b ;

initial begin
    $display ("debugging design");
end 

endmodule //mux_2to1