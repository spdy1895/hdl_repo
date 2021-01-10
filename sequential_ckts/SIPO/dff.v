`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: open-source 
// Engineer: shubham pandey
// 
// Create Date: 05.01.2021 05:14:52
// Design Name: behavioral design
// Module Name: dff
// Project Name: SIPO shift register
// Target Devices: 
// Tool Versions: 2020.2
// Description: positive edge triggered d flip flop
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
    output wire qbar, 
    input wire d,
    input wire clear,
    input wire clk 
    );

    assign qbar= ~q;

    always @(posedge clk) begin
        if (!clear) q<= 0;      //active low clear
        else q<= d;
    end

endmodule
