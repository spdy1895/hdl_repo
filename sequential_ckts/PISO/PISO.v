`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: open-source
// Engineer: shubham pandey
// 
// Create Date: 08.01.2021 23:40:39
// Design Name: behavioral approach
// Module Name: PISO
// Project Name: PISO
// Target Devices: SPARTAN-3
// Tool Versions: 2020.2
// Description: a parameterized parallel-in parallel out shift register.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PISO #(parameter width= 7)(
    output wire serial_out,
    input wire [width:0] parallel_in,
    input wire clk,
    input wire clr,
    input wire en
    );

    wire [width:0] w;   //output of the initial dff.
    wire [width:0] m;   //output of mux.
    //initial dff
    dff d0(w[0], parallel_in[0], clk, clr);
    assign serial_out= w[width];

    genvar i;
    generate
        for (i= 0; i< width; i= i+1) begin
            //make enabel active low for parallel input.
            //active high enable for shift register.
            mux2to1 m0(m[i+1], parallel_in[i+1], w[i], en);
            dff d1(w[i+1], m[i+1], clk, clr);
        end
    endgenerate
endmodule
