//LMAO
module Alu(
    input clk,
    input signed [3:0] a, b,
    input [3:0] sel,  // 0-7: arithmetic, 8-15: logic
    output reg signed [7:0] out
);

    reg signed [3:0] a_reg, b_reg;

    // Internal outputs
    wire signed [7:0] arith_out;
    wire signed [3:0] logic_out;

    // Registering inputs
    always @(posedge clk) begin
        a_reg <= a;
        b_reg <= b;
    end

    // Instantiate arithmetic and logic units
    arithmetic_unit arith_inst (
        .clk(clk),
        .a(a_reg),
        .b(b_reg),
        .sel(sel[2:0]),
        .a_out(arith_out)
    );

    Logic_Unit logic_inst (
        .clk(clk),
        .a(a_reg),
        .b(b_reg),
        .sel(sel),
        .l_out(logic_out)
    );

    // Output selection
    always @(posedge clk) begin
        if (~sel[3])  // Arithmetic operations
            out <= arith_out;
        else  // Logic operations
            out <= {{4{logic_out[3]}}, logic_out};  // Sign-extend logic output
    end
endmodule
