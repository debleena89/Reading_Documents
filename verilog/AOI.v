//AOI module definition
module AOI(A,B,C,D,y);

//port declaration

input A, B, C, D;
output y;

wire e,f,g;

and i1(e,A, B);

and i2(f, C, D);

or i3(g, e, f);

not i4(y, g);

endmodule

