`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: open-source
// 
// Create Date: 09.01.2021 00:41:58
// Design Name: behavioral approach
// Module Name: PISO_tb
// Project Name: PISO
// Target Devices: SPARTAN-3
// Tool Versions: 2020.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PISO_tb(

    );

    wire serial_out;
    reg [15:0] parallel_in;
    reg clk;
    reg clr;
    reg en;

    //instantiation of module
        PISO #(15) P0 (serial_out, parallel_in, clk, clr, en);

        initial begin
            clk= 1'b0;
            forever #5 clk= ~clk;
        end

        initial begin
            #20 clr= 1'b1;
            #50 clr= 1'b0; en= 1'b0; parallel_in= 16'b1010_0101_1010_0101;
            #10 en= 1'b1;
            #100 en= 1'b0; parallel_in= 16'b0101_0101_0101_0101;
            #10 en= 1'b1;
            #100 $finish;
        end
endmodule
