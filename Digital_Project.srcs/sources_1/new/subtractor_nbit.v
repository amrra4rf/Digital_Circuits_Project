module subtractor_nbit #(parameter n=4) (
    input [n-1:0] a, b,
    input c_in,
    output [n-1:0] s,
    output c_out, overflow
);
    wire [n-1:0] b_xored;

    genvar k;
    generate
        for (k = 0; k < n; k = k + 1) begin
            assign b_xored[k] = b[k] ^ c_in;
        end
    endgenerate

    adder_nbit #(.n(n)) sub (
        .x(a),
        .y(b_xored),
        .c_in(c_in),
        .s(s),
        .c_out(c_out),
        .overflow(overflow)
    );
endmodule
