module top;

wire r1;
wire r2;

wire g1;
wire g2;
reg clk;
reg rstn;

arbiter A (r1, r2, g1, g2, clk, rstn);

initial begin
  clk = 1;
  rstn = 0;
  forever begin
      #1 clk = ~clk;
  end
end


endmodule
