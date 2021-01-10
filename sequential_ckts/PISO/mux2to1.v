`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: open-source
// Engineer: shubham pandey
// 
// Create Date: 08.01.2021 23:57:13
// Design Name: behavioral approach
// Module Name: mux2to1
// Project Name: PISO
// Target Devices: SPARTAN-3
// Tool Versions: 2020.2
// Description: a 2 to 1 mux to select between parallel input and
//              serial input.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2to1(
    output wire out,
    input wire in0,
    input wire in1,
    input wire en 
    );

    assign out= (en==1) ? in1 : in0;
endmodule
