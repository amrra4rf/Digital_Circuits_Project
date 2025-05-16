module full_adder(
    input x, y, c_in,
    output c_out, s
);
    wire c1, c2, s1;

    Half_adder Ha0 (.x(x), .y(y), .c(c1), .s(s1));
    Half_adder Ha1 (.x(c_in), .y(s1), .c(c2), .s(s));
    
    assign c_out = c1 | c2;
endmodule
