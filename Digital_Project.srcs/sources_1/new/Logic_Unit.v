module Logic_Unit(
    input clk,
    input [3:0] a, b,
    input [3:0] sel,
    output reg signed [3:0] l_out
);
    reg [3:0] a_reg, b_reg;
    wire [3:0] xor_result;
    wire [3:0] xnor_result;
    wire [3:0] nand_result;
    wire [3:0] nor_result;
    wire [3:0] not_a_result;
    wire [3:0] not_b_result;

    xor_4bits xor_inst (
        .x(a_reg),
        .y(b_reg),
        .z(xor_result)
    );

    xnor_4bits xnor_inst (
        .x(a_reg),
        .y(b_reg),
        .z(xnor_result)
    );

    Nand_4bits nand_inst (
        .x(a_reg),
        .y(b_reg),
        .z(nand_result)
    );

    nor_4bits nor_inst (
        .x(a_reg),
        .y(b_reg),
        .z(nor_result)
    );

    ones_complement not_a_inst (
        .x(a_reg),
        .z(not_a_result)
    );

    ones_complement not_b_inst (
        .x(b_reg),
        .z(not_b_result)
    );


wire [3:0] and_result;
And_Gate_4bit and_inst (
    .x(a_reg),
    .y(b_reg),
    .z(and_result)
);


wire [3:0] or_result;
OR_Gate_Nbits or_inst (
    .x(a_reg),
    .y(b_reg),
    .z(or_result)
);

    always @(posedge clk) begin
        a_reg <= a;
        b_reg <= b;
    end

    always @(posedge clk) begin
        case(sel)
            4'b1000: l_out = not_a_result;
            4'b1001: l_out = not_b_result;
            4'b1010: l_out = and_result;
            4'b1011: l_out =or_result;
            4'b1100: l_out = xor_result;
            4'b1101: l_out = xnor_result;
            4'b1110: l_out = nand_result;
            4'b1111: l_out = nor_result;
            default: l_out = 4'bxxxx;
        endcase
    end
endmodule
