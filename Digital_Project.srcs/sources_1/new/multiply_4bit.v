`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 08:45:33 PM
// Design Name: 
// Module Name: multiply_4bit
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


module multiply_4bit(
    input  [3:0] x, y,
    output [7:0] out
    );

wire a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4,d1,d2,d3,d4;
wire o2,o3,o4,o6,o7,o8,o10,o11,o12;
wire r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;

assign a1 = x[0] & y[0];
assign a2 = x[1] & y[0];
assign a3 = x[2] & y[0];
assign a4 = x[3] & y[0];
assign b1 = x[0] & y[1];
assign b2 = x[1] & y[1];
assign b3 = x[2] & y[1];
assign b4 = x[3] & y[1];
assign c1 = x[0] & y[2];
assign c2 = x[1] & y[2];
assign c3 = x[2] & y[2];
assign c4 = x[3] & y[2];
assign d1 = x[0] & y[3];
assign d2 = x[1] & y[3];
assign d3 = x[2] & y[3];
assign d4 = x[3] & y[3];

full_adder FA1(.x(a1), .y(1'b0), .c_in(1'b0), .s(out[0]), .c_out(r1));
full_adder FA2(.x(a2), .y(1'b0), .c_in(r1), .s(o2), .c_out(r2));
full_adder FA3(.x(a3), .y(1'b0), .c_in(r2), .s(o3), .c_out(r3));
full_adder FA4(.x(a4), .y(1'b0), .c_in(r3), .s(o4), .c_out(r4));
full_adder FA5(.x(b1), .y(o2), .c_in(1'b0), .s(out[1]), .c_out(r5));
full_adder FA6(.x(b2), .y(o3), .c_in(r5), .s(o6), .c_out(r6));
full_adder FA7(.x(b3), .y(o4), .c_in(r6), .s(o7), .c_out(r7));
full_adder FA8(.x(b4), .y(r4), .c_in(r7), .s(o8), .c_out(r8));
full_adder FA9(.x(c1), .y(o6), .c_in(1'b0), .s(out[2]), .c_out(r9));
full_adder FA10(.x(c2), .y(o7), .c_in(r9), .s(o10), .c_out(r10));
full_adder FA11(.x(c3), .y(o8), .c_in(r10), .s(o11), .c_out(r11));
full_adder FA12(.x(c4), .y(r8), .c_in(r11), .s(o12), .c_out(r12));
full_adder FA13(.x(d1), .y(o10), .c_in(1'b0), .s(out[3]), .c_out(r13));
full_adder FA14(.x(d2), .y(o11), .c_in(r13), .s(out[4]), .c_out(r14));
full_adder FA15(.x(d3), .y(o12), .c_in(r14), .s(out[5]), .c_out(r15));
full_adder FA16(.x(d4), .y(r12), .c_in(r15), .s(out[6]), .c_out(out[7]));

endmodule
