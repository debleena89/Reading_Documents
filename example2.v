module counter(out,enable, clk);

  output [7:0] out;
  input enable, clk;

  reg [7:0] state;
  assign out = state;

  initial state = 0;

  always @(posedge clk)
    if(enable)
      state = state + 1;

  assert property (enable && state[0] |-> ##1 !state[0]);
  assert property (state!=3);

endmodule
