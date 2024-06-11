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



      
