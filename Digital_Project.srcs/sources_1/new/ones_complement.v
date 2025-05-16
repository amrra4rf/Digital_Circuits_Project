module ones_complement(
    input [3:0] x,
    output [3:0] z
);
       generate
genvar k;
for(k=0;k<4;k=k+1)
begin 
assign z[k]=~x[k];
end
endgenerate
endmodule
