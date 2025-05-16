module Alu(
    input clk,
    input [3:0]  sel,
    input signed [3:0] a, b,
    output reg signed [7:0] out
);

    wire signed [7:0] arith_out;
    wire [3:0] logic_out;

    // Instantiate the arithmetic and logic units
    arithmetic_unit au (
        .clk(clk),
        .a(a),
        .b(b),
        .sel(sel[3:0]),    // Pass only lower 3 bits to arithmetic unit
        .a_out(arith_out)
    );

    Logic_Unit lu (
        .clk(clk),
        .a(a),
        .b(b),
        .sel(sel[3:0]),    // Pass only lower 3 bits to logic unit
        .l_out(logic_out)
    );

    // Select between arithmetic and logic results based on the 4th bit (sel[3])
    always @(*) begin
        if (sel[3] == 1'b0)
            out = arith_out;  // If sel[3] is 0, output from arithmetic unit
        else
            out = {{4{logic_out[3]}}, logic_out};  // If sel[3] is 1, output from logic unit (4-bit logic result extended to 8 bits)
    end
endmodule
