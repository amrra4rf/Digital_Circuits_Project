`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2025 03:20:23 PM
// Design Name: 
// Module Name: OR_Gate_Nbits
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OR_Gate_Nbits
    #(parameter n = 4)
    (
    input  [n-1:0] x,
    input  [n-1:0] y,
    output [n-1:0] z   
    );

    generate
    genvar k;  
    for(k=0;k<n;k = k + 1)
    begin
    assign  z[k]=x[k]| y[k];
    end
    endgenerate 
    
endmodule
