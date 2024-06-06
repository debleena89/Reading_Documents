 
 

 
 
 
 module T_FF(q, clk, reset);
 
   output q;
   input clk, reset;
   wire d;
   
   D_FF dff0(q, d, clk, reset);
   not n1(d,q);

endmodule

module D_FF(q, d, clk, reset);

   
  output q;
  input d, clk, reset;
  reg q;
  always @(posedge reset or negedge clk)
  if (reset)
     q = 1'b0;
  else
     q = d;
endmodule
 
 
module stimulus;
reg clk;
reg reset;
wire[3:0] q;

//instantiate the design block

ripple_carry_counter r1 (q,clk, reset);

//control the clk signal that drives the design block cycle time = 10
initial 
   clk = 'b0; // set clk to 0
always
   #5 clk = ~clk; // toggole clk every 5 times units
   
   
   // Control the reset signal that drives the design block
   //reset is asserted from 0 to 20 and from 200 to 220.

initial
begin

    $dumpfile("stimulus_block.vcd");
    $dumpvars(0,stimulus);   
    reset = 1'b1;
    #15 reset = 1'b0;
    #180 reset = 1'b1;
    #10 reset = 1'b0;
    #20 $finish; //terminate the simulation
 end
 
 //Monitor the outputs
 
 initial
     
     $monitor($time, "output q = %d", q);
     
 endmodule
 
