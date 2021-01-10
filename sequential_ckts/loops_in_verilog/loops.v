//module to explain loops in verilog
/*
>while loop
-for loop
*repeat loop
@forever loop
*/

module loops (output reg out_clk,
                input wire clk
    
);
initial out_clk=0;
integer i=0;
initial begin
    while (i<1) begin
        $display("while loop executed!");       
        i=i+1;
    end
    //here one can also notice the difference between 
    //execution of while and for loop.
    for (i =0 ;i<1 ;i=i+1 ) begin
        $display("for loop executed!");
    end
end

initial begin
    repeat (3) @(negedge clk) begin     
        //from first negedge clock this repeat
        // block should execute thrice. 
        $display($time,"executing repeat loop!");
        out_clk= ~out_clk;
    end
end

endmodule //loops