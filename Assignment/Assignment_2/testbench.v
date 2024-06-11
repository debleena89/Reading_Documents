`timescale 1ns/1ps
 module testbench;
 reg clk, rst, UpDown;


 up_down_counter uut(.clk(clk), .rst(rst), .UpDown(UpDown));

 initial
  begin
     clk = 0;
     rst = 0;
     UpDown = 1'b0;
  end
  
  always #1 clk = ~clk;
  
  initial
   begin
  rst = 1; 
  #2; 
  rst = 0;
  #2;
UpDown = 1;
#67;

UpDown = 0;
#65;


$finish;

   end
   endmodule

	 
