//AOI module definition
module AOI_1(A,B,C,D,y);

//port declaration

input A, B, C, D;
output y;

assign y = ~((A & B) | (C & D));

endmodule

