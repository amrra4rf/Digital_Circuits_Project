`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 04:10:06 PM
// Design Name: 
// Module Name: arithmetic_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Arithmetic unit with 5-bit addition/subtraction results.
// 
//////////////////////////////////////////////////////////////////////////////////

module arithmetic_unit(
 input clk,
    input signed [3:0] a, b,
    input [2:0] sel,
    output reg signed [7:0] a_out
);
    reg signed [3:0] a_reg, b_reg;

    wire [3:0] sum_a, carry_a;
    wire [3:0] sum_b, carry_b;

    full_adder fa0 (.x(a_reg[0]), .y(1'b1), .c_in(1'b0),    .s(sum_a[0]), .c_out(carry_a[0]));
    full_adder fa1 (.x(a_reg[1]), .y(1'b0), .c_in(carry_a[0]), .s(sum_a[1]), .c_out(carry_a[1]));
    full_adder fa2 (.x(a_reg[2]), .y(1'b0), .c_in(carry_a[1]), .s(sum_a[2]), .c_out(carry_a[2]));
    full_adder fa3 (.x(a_reg[3]), .y(1'b0), .c_in(carry_a[2]), .s(sum_a[3]), .c_out(carry_a[3]));

    full_adder fb0 (.x(b_reg[0]), .y(1'b1), .c_in(1'b0),    .s(sum_b[0]), .c_out(carry_b[0]));
    full_adder fb1 (.x(b_reg[1]), .y(1'b0), .c_in(carry_b[0]), .s(sum_b[1]), .c_out(carry_b[1]));
    full_adder fb2 (.x(b_reg[2]), .y(1'b0), .c_in(carry_b[1]), .s(sum_b[2]), .c_out(carry_b[2]));
    full_adder fb3 (.x(b_reg[3]), .y(1'b0), .c_in(carry_b[2]), .s(sum_b[3]), .c_out(carry_b[3]));

    wire [3:0] dec_sum;
    wire [3:0] dec_carry;
    full_adder dec_fa0 (.x(a_reg[0]), .y(1'b1),    .c_in(1'b0),       .s(dec_sum[0]), .c_out(dec_carry[0]));
    full_adder dec_fa1 (.x(a_reg[1]), .y(1'b1),    .c_in(dec_carry[0]),.s(dec_sum[1]), .c_out(dec_carry[1]));
    full_adder dec_fa2 (.x(a_reg[2]), .y(1'b1),    .c_in(dec_carry[1]),.s(dec_sum[2]), .c_out(dec_carry[2]));
    full_adder dec_fa3 (.x(a_reg[3]), .y(1'b1),    .c_in(dec_carry[2]),.s(dec_sum[3]), .c_out(dec_carry[3]));

    wire [7:0] mult_result;
    multiply_4bit mult_inst (
        .x(a_reg),
        .y(b_reg),
        .out(mult_result)
    ); 

    wire [3:0] sum_ab;
    wire [3:0] carry_ab;

    full_adder fa_ab0(.x(a_reg[0]), .y(b_reg[0]), .c_in(1'b0),        .s(sum_ab[0]), .c_out(carry_ab[0]));
    full_adder fa_ab1(.x(a_reg[1]), .y(b_reg[1]), .c_in(carry_ab[0]), .s(sum_ab[1]), .c_out(carry_ab[1]));
    full_adder fa_ab2(.x(a_reg[2]), .y(b_reg[2]), .c_in(carry_ab[1]), .s(sum_ab[2]), .c_out(carry_ab[2]));
    full_adder fa_ab3(.x(a_reg[3]), .y(b_reg[3]), .c_in(carry_ab[2]), .s(sum_ab[3]), .c_out(carry_ab[3]));

    wire [3:0] sub_result;
    wire sub_c_out, sub_overflow;
    subtractor_nbit #(.n(4)) sub_inst (
        .a(a_reg),
        .b(b_reg),
        .c_in(1'b1),              // c_in = 1 for subtraction (2's complement logic)
        .s(sub_result),
        .c_out(sub_c_out),
        .overflow(sub_overflow)
    );

    // 5-bit add and subtract results (carry/borrow + 4 bits)
    wire [4:0] add_result_5bit = {carry_ab[3], sum_ab};
   wire sub_sign_bit = ~sub_c_out;  // invert carry_out to get correct sign bit for subtraction
wire [4:0] sub_result_5bit_fixed = {sub_sign_bit, sub_result};

    // On every rising edge of clk, capture values of a, b
    always @(posedge clk) begin
        a_reg <= a;
        b_reg <= b;
    end

    // Perform arithmetic operations based on sel[3:0]
    always @(posedge clk) begin
        case(sel)
            4'b0000: a_out = {{4{sum_a[3]}}, sum_a};          // increment a by 1
            4'b0001: a_out = {{4{sum_b[3]}}, sum_b};          // increment b by 1
            4'b0010: a_out = {{4{a_reg[3]}}, a_reg};          // transfer a
            4'b0011: a_out = {{4{b_reg[3]}}, b_reg};          // sign-extend b
            4'b0100: a_out = {{4{dec_sum[3]}}, dec_sum};      // decrement a by 1
            4'b0101: a_out = mult_result;                      // multiply a and b
            4'b0110:a_out= {{3{add_result_5bit[4]}}, add_result_5bit};       // 5 bit addition zero extended to 8 bit
            4'b0111:a_out= {{3{sub_result_5bit_fixed[4]}}, sub_result_5bit_fixed};       // 5 bit subtraction zero extended to 8 bit
            default: a_out = 8'bxxxxxxxx;
        endcase
    end
endmodule
