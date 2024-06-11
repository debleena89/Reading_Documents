module YZ_dut(a, b, c, Y, Z);

    input  a, b, c;
    
    output Y, Z;
    
    wire  e, f, g;
    
    
    
    and A1(e, b, c);
    and A2(f, e, a);
    or O1(g, b, c);
    or O2(Y, a, e );
    or O3(Z, f, g);
     
endmodule   


module testbench;

    reg ta, tb, tc;
    
    wire ty,tz;
    
    YZ_dut inst(ta, tb, tc, ty, tz);
    
    initial 
    begin
    
       ta = 1'b0;
       tb = 1'b0;
       tc = 1'b0;
       
       //$display("                time: ta tb tc : ty : tz");
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
     // $monitor($time, ": ", ta,"  ", tb,"  ", tc,"  ", ":", " ",ty,"  ", ":"," ", tz);
      #100 $finish;
    end
    
    
endmodule    
      
