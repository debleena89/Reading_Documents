module carry(s,cy,A,B,C);
input A,B,C;
output s, cy;
assign s = A ^ B ^ C;
assign cy= (A & B ) | (B & C) | (C & A);
endmodule
