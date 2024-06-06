module add4 (s, Cy4, Cy_in, x, y, Cy_out);
    input [3 : 0] x, y;
    input Cy_in;
    output [3 : 0] s;
    output Cy4, Cy_out;
    wire [2 : 0] Cy_out;
    add B0 (Cy_out[0], s[0], x[0], y[0], ci);
    add B1 (Cy_out[1], s[1], x[1], y[1], Cy_out[0]);
    add B2 (Cy_out[2], s[2], x[2], y[1], Cy_out[1]);
    add B3 (Cy4, s[3], x[3], y[3], Cy_out[2]);
endmodule
