`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: open-source
// Engineer: shubham pandey
// 
// Create Date: 05.01.2021 06:03:20
// Design Name: behavioral approach
// Module Name: SIPO_tb
// Project Name: SIPO
// Target Devices: zedboard
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


module SIPO_tb(

    );

    parameter width= 7;
    wire [width:0] parallel_out;
    reg in;
    reg clr;
    reg clk;

    //instantiation of SIPO module
    SIPO #(7) s0(parallel_out, in, clr, clk);

    initial begin
        clk= 0;
        forever #5 clk= ~clk;
    end

    initial begin
        #20 clr= 0; //clear activated
        #28 {clr, in}= 2'b11;       //clear deactivated
        #10 in= 0;
        #90 in= 1;
        #20 in= 0;
        #100 $finish;

    end

endmodule
