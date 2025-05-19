module Logic_Unit(
    input clk,
    input [3:0] a, b,
    input [3:0] sel,
    output reg signed [3:0] l_out
);
    // Direct use of inputs a, b instead of registers
    wire [3:0] xor_result, xnor_result, nand_result, nor_result;
    wire [3:0] not_a_result, not_b_result, and_result, or_result;

    xor_4bits xor_inst (.x(a), .y(b), .z(xor_result));
    xnor_4bits xnor_inst (.x(a), .y(b), .z(xnor_result));
    Nand_4bits nand_inst (.x(a), .y(b), .z(nand_result));
    nor_4bits nor_inst (.x(a), .y(b), .z(nor_result));
    ones_complement not_a_inst (.x(a), .z(not_a_result));
    ones_complement not_b_inst (.x(b), .z(not_b_result));
    And_Gate_4bit and_inst (.x(a), .y(b), .z(and_result));
    OR_Gate_Nbits or_inst (.x(a), .y(b), .z(or_result));

    always @(posedge clk) begin
        case(sel)
            4'b1000: l_out = not_a_result;
            4'b1001: l_out = not_b_result;
            4'b1010: l_out = and_result;
            4'b1011: l_out = or_result;
            4'b1100: l_out = xor_result;
            4'b1101: l_out = xnor_result;
            4'b1110: l_out = nand_result;
            4'b1111: l_out = nor_result;
            default: l_out = 8'bxxxxxxxx;
        endcase
    end
endmodule
