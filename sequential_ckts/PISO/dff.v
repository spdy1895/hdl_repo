`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: open-source
// Engineer: shubham pandey
// 
// Create Date: 08.01.2021 23:57:39
// Design Name: behavioral approach
// Module Name: dff
// Project Name: PISO
// Target Devices: SPARTAN-3
// Tool Versions: 2020.2
// Description: a simple dff with clear input.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dff(
    output reg q,
    input wire d,
    input wire clk,
    input wire clr  
    );

    always @(posedge clk) begin
        //active high clear input.
        if(clr) q<= 1'b0;
        else q<= d;
    end
endmodule
