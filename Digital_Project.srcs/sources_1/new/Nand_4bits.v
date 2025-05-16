`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 07:33:16 PM
// Design Name: 
// Module Name: Nand_4bits
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


module Nand_4bits(
input [3:0]x,y,
output[3:0]z
  );
    nand nand0(z[0], x[0], y[0]);
    nand nand1(z[1], x[1], y[1]);
    nand nand2(z[2], x[2], y[2]);
    nand nand3(z[3], x[3], y[3]);
endmodule
