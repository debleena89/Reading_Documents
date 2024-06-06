module arbiter(r1, r2, g1, g2, clk, rstn);

	input clk, r1, r2 , rstn;
	output g1, g2;
	reg g1, g2;
	always @(posedge clk )
    begin
	      g2<=r2 & ~r1 & ~g1;
		  g1 <= r2;
    end

endmodule
