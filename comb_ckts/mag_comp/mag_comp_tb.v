//test bench for magnitude comparator
`timescale 1ns/1ps
module mag_comp_tb (
    
);

wire E,G,L;
reg [3:0] A,B;

//instantiation 
mag_comp m1 (E,G,L,A,B);

initial begin
    $dumpfile("mag_comp_tb.vcd");
    $dumpvars(0,mag_comp_tb);

    $monitor($time,"equal= %b greater= %b lesser= %b a= %b b= %b",E,G,L,A,B);

    #1 A=4'b1101; B=4'b1010;
    #1 A=4'b1100; B=4'b1110;
    #1 A=4'b0001; B=4'b0001;

end

endmodule //mag_comp_tb