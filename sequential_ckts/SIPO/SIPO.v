`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: open-source
// Engineer: shubham pandey
// 
// Create Date: 04.01.2021 18:06:40
// Design Name: behavioral approach
// Module Name: SIPO
// Project Name: SIPO
// Target Devices: zedboard
// Tool Versions: 2020.2
// Description: a parameterized model of SIPO shift register using dff.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SIPO #(parameter width= 7) (
    output wire [width:0] parallel_out,
    input wire in,
    input wire clr,
    input wire clk
    );

    wire [width:0] w;
    dff d0(w[0], , in, clr, clk);
    assign parallel_out[0]= w[0];

    //using generate construct for parameterized model
    genvar i;
    generate
        for (i= 0; i< width ; i= i+1) begin: sftreg
            wire w1;
            dff d1(w[i+1], , w[i], clr, clk);
            assign parallel_out[i+1]= w[i+1];
            end
    endgenerate
    
endmodule
