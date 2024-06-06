module repeat_example (); 
 
  reg r_Clock = 1'b0;
   
  initial
    begin
 
      repeat (10)
        #5 r_Clock = !r_Clock;
 
      $display("Simulation Complete");
    end
endmodule
