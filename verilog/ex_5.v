module using_supply_wire(A, B, C, f);

    input A, B, C;
    output f;
    
    supply0 gnd;
    supply1 vdd;
    
    nand G1(t1, vdd, A, B);
    
    xor G2(t2, C, gnd);
    
    and G3(f, t1, t2);
    
endmodule   
