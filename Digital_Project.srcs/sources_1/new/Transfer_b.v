`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2025 08:10:12 PM
// Design Name: 
// Module Name: Transfer_b
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


module Transfer_b(
    input [3:0]a,b,
    output[3:0]out
    );
    generate
    genvar k;
    for(k=0;k<4;k=k+1)
    begin
        assign out[k]=b[k];
    end
    endgenerate
endmodule
