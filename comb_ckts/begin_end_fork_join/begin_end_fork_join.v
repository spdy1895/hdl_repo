`timescale 1ns/1ps 
//hdl module to see the flow of control in nested begin-end and 
//>fork-join block.
module begin_end_fork_join (
    
);

reg x, y, a, b, p, m;

initial begin
    x= 1'b0; $display($time,"x \n");
    #5 y= 1'b1; $display($time,"y \n");
    fork
        #20 a=x;  
        #20 $display($time,"a \n");
        #15 b=y;  
        #15 $display($time,"b \n");
    join
    #40 x= 1'b1;  $display($time,"x \n");
    fork
        #10 p=x;  
        #10$display($time,"p \n");
        begin
            #10 a=y;  $display($time,"a \n");
            #30 b=x;  $display($time,"b \n");
        end
        #5 m=y;  
        #5 $display($time,"m \n");
    join

end

endmodule //begin_end_fork_join 