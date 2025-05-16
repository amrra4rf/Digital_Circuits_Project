module adder_nbit #(parameter n = 4) (
    input [n-1:0] x, y,
    input c_in,
    output [n-1:0] s,
    output c_out,
    output overflow
);
    wire [n:0] c;
    assign c[0] = c_in;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : gen_adder
            full_adder fa (
                .x(x[i]),
                .y(y[i]),
                .c_in(c[i]),
                .s(s[i]),
                .c_out(c[i+1])
            );
        end
    endgenerate

    assign c_out = c[n];
    assign overflow = c[n] ^ c[n-1];
endmodule
