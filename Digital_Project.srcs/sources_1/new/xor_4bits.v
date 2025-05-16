`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 06:58:24 PM
// Design Name: 
// Module Name: xor_4bits
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


module xor_4bits(
input [3:0]x,y,
output[3:0]z
    );
generate
genvar k;
for(k=0;k<4;k=k+1)
begin 
assign z[k]=x[k]^y[k];
end
endgenerate
endmodule

