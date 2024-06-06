primitive carry (Cy, A, B, C);
    input A, B, C;
    output Cy;
    table 
       // A B C   Cy
          1 1 ? : 1 ;
          1 ? 1 : 1 ;
          ? 1 1 : 1 ;
          0 0 ? : 0 ;
          0 ? 0 : 0 ;
          ? 0 0 : 0 ;
     endtable
endprimitive     
