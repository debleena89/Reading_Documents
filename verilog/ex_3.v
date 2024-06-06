module use_wire(A, B, C, D, f);

    input A, B, C, D;
    output f;
    
    wire f;
    
    assign f = A & B;
    
    assign f = C | D;

endmodule    
   
