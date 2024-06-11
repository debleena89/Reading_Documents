module readmem();

   localparam  ADDR_WIDTH = 8, DATA_WIDTH = 32;
   localparam MEM_DEPTH = 1 << ADDR_WIDTH;
    reg  [DATA_WIDTH-1:0] sram[0:MEM_DEPTH-1];


   initial begin
        $display("Loading rom.");
        $readmemh("sum.mem",sram);
    end
endmodule

