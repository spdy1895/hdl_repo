`timescale 1ns/1ps 
//hdl module to generate clock with 40% duty cycle
//using forever keyword.
//>without using any external input

module self_clock (output reg clk
    
);

integer i=0;

initial begin
    clk= 1'b0;
    forever begin
       if(i> 5 && i< 10) clk= 1'b1;
       else if(i>9) begin clk= 1'b0; i=0; end
       #1 i=i+1;
    end
end

initial begin
    $dumpfile("self_clock.vcd");
    $dumpvars(0, self_clock);

    #100 $finish;
end
endmodule //self_clock