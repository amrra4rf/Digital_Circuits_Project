`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2025 03:45:26 PM
// Design Name: 
// Module Name: Full_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_Adder(
    input a,b,c_in,
    output c_out,sum
    );
    wire c1,s1,c2;
    Half_adder HA0 (
    .a(a),
    .b(b),
    .c_out(c1),
    .sum(s1)
    );
     Half_adder HA1 (
    .a(c_in),
    .b(s1),
    .c_out(c2),
    .sum(sum)
    );
    assign c_out = c1 | c2;
endmodule
