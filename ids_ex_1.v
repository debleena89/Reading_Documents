module carry (S, Cy, A, B, C);
    input A, B, C;
    output S, Cy;
    assign S = A ^ B ^ C;
    assign Cy = (A & B) | (B & C) | (C & A);
endmodule
