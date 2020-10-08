`timescale 1ns/1ps 

//hdl module to generate clock using while loop
module clk (output reg out_clk
    
);

initial begin
    out_clk= 1'b0;
    while (1) #5 out_clk= ~out_clk;
end

initial begin
    $dumpfile("clk.vcd");
    $dumpvars(0, clk);
    #200 $finish;
 
end
endmodule //clk