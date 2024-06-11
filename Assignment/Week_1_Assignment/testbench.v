module testbench;

    reg ta, tb, tc;
    
    wire ty,tz;
    
    YZ_dut inst(ta, tb, tc, ty, tz);
    
    initial 
    begin
    
       ta = 1'b0;
       tb = 1'b0;
       tc = 1'b0;
       
       $display("                time: ta tb tc : ty : tz");
       #10 tc = 1'b1;
       
       #10 tb = 1'b1; tc = 1'b0;
       
       #10  tc = 1'b1;
       
       #10 ta = 1'b1; tb = 1'b0; tc = 1'b0;
       
       #10 tc = 1'b1;
       
       #10 tb = 1'b1; tc = 1'b0;
       
       #10 tc = 1'b1;
       
       
    end
    
    
      
    initial
    begin
     $monitor($time, ": ", ta,"  ", tb,"  ", tc,"  ", ":", " ",ty,"  ", ":"," ", tz);
      #100 $finish;
    end
    
    
endmodule    
